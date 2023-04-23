local command = vim.api.nvim_create_user_command

local start_time = 0
local total_minutes = 0
local DONE = 0
local RUNNING = 1
local state = DONE

local already_notified_end = false

--- The default options
local DEFAULT_OPTIONS = {
  work_time = 25,
  break_time = 5,
  texts = {
    on_break_complete = "TIME IS UP!",
    on_work_complete = "TIME IS UP!",
    status_icon = "羽",
    timer_format = '!%0M:%0S' -- To include hours: '!%0H:%0M:%0S'
  },
  on_work_complete = function() end,
  on_break_complete = function() end
}

-- Local functions

local function time_remaining_seconds(duration, start)
  return duration * 60 - os.difftime(os.time(), start)
end

local function time_remaining(duration, start)
  return os.date(vim.g.pomodoro.texts.timer_format, time_remaining_seconds(duration, start))
end

local function is_work_time(duration)
  return duration == vim.g.pomodoro.work_time
end

local function start(minutes)
  start_time = os.time()
  total_minutes = minutes
  already_notified_end = false
  state = RUNNING
end

-- Plugin functions

local pomodoro = {}

function pomodoro.setup(options)
  local new_config = vim.tbl_deep_extend('force', DEFAULT_OPTIONS, options)
  vim.g.pomodoro = new_config
end

function pomodoro.status()
  local status_string = ""
  if state == RUNNING then
    if time_remaining_seconds(total_minutes, start_time) <= 0 then
      if is_work_time(total_minutes) then
        status_string = vim.g.pomodoro.texts.on_work_complete
        if not already_notified_end then
          vim.g.pomodoro.on_work_complete()
          already_notified_end = true
        end
      else
        status_string = vim.g.pomodoro.texts.on_break_complete
        if not already_notified_end then
          vim.g.pomodoro.on_break_complete()
          already_notified_end = true
        end

      end
    else
      status_string = vim.g.pomodoro.texts.status_icon .. time_remaining(total_minutes, start_time)
    end
  end
  return status_string
end

function pomodoro.stop()
  state = DONE
end

-- Menu
local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

function pomodoro.show_menu()
  local popup_options = {
    border = {
      style = 'rounded',
      padding = { 1, 3 },
    },
    position = '50%',
    size = {
      width = '25%',
    },
    opacity = 1,
  }

  local menu_options = {
    keymap = {
      focus_next = { 'j', '<Down>', '<Tab>' },
      focus_prev = { 'k', '<Up>', '<S-Tab>' },
      close = { '<Esc>', '<C-c>' },
      submit = { '<CR>', '<Space>' },
    },
    lines = {
      Menu.item('Start Work'),
      Menu.item('Start Break'),
      Menu.item('Stop'),
    },
    on_close = function()
    end,
    on_submit = function(item)
      if item.text == 'Start Work' then
        start(vim.g.pomodoro.work_time)
      elseif item.text == 'Start Break' then
        start(vim.g.pomodoro.break_time)
      elseif item.text == 'Stop' then
        pomodoro.stop()
      end
    end
  }
  local menu = Menu(popup_options, menu_options)

  menu:mount()

  menu:on(event.BufLeave, function()
    menu:unmount()
  end, { once = true })
  menu:map('n', 'q', function()
    menu:unmount()
  end, { noremap = true })

end

-- Expose commands

command("PomodoroWork", function()
  start(vim.g.pomodoro.work_time)
end, {})

command("PomodoroBreak", function()
  start(vim.g.pomodoro.break_time)
end, {})

command("PomodoroStop", function()
  pomodoro.stop()
end, {})

command("PomodoroStatus", function()
  print(pomodoro.status())
end, {})

command("PomodoroTimer", function(opts)
  start(opts.args)
end, { nargs = 1 })

command("PomodoroMenu", function()
  pomodoro.show_menu()
end, {})

return pomodoro
