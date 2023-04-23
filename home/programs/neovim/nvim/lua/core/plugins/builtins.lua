local register = require("core.plugins.register")
local utils = require("core.plugins.utils")

return register.register(function(_user)
  return {
    -- Core
    ["lewis6991/impatient.nvim"] = {
      opt = false,
      disabled = vim.g.vscode
    },
    ["nathom/filetype.nvim"] = { opt = false, disabled = vim.g.vscode },
    ["antoinemadec/FixCursorHold.nvim"] = { event = { "BufRead", "BufNewFile" }, disabled = vim.g.vscode },
    ["nvim-lua/plenary.nvim"] = { module = { "plenary", "plenary.job" }, disabled = vim.g.vscode },
    ["nvim-lua/popup.nvim"] = { module = "popup", disabled = vim.g.vscode },
    ["tweekmonster/startuptime.vim"] = { cmd = "StartupTime", disabled = vim.g.vscode },
    -- Misc
    ["jghauser/mkdir.nvim"] = { event = { "BufWritePre" } },
    ["max397574/better-escape.nvim"] = { event = "InsertCharPre", config = utils.config("better_escape") },
    ["tpope/vim-eunuch"] = {
      cmd = {
        "Remove",
        "Delete",
        "Move",
        "Chmod",
        "Mkdir",
        "Cfind",
        "Clocate",
        "CFind",
        "Wall",
        "SudoWrite",
        "SudoEdit",
      },
    },
    ["pianocomposer321/yabs.nvim"] = { module = "yabs", config = utils.config("yabs") },
    -- UI Core
    ["rcarriga/nvim-notify"] = { module = "notify" },
    ["stevearc/dressing.nvim"] = { event = "BufReadPre" },
    ["kyazdani42/nvim-web-devicons"] = { module = "nvim-web-devicons" },
    -- Code Syntax
    ["nvim-treesitter/nvim-treesitter"] = {
      run = ":TSUpdate",
      event = { "BufReadPre" },
      cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSDisableAll",
        "TSEnableAll",
      },
      wants = {
        "nvim-ts-rainbow",
        "nvim-ts-context-commentstring",
      },
      requires = {
        "p00f/nvim-ts-rainbow",
        "JoosepAlviste/nvim-ts-context-commentstring",
      },
      config = utils.config("treesitter"),
    },
    -- Terminal
    ["akinsho/toggleterm.nvim"] = {
      cmd = { "ToggleTerm", "TermExec" },
      module = { "toggleterm", "toggleterm.terminal" },
      config = utils.config("toggleterm"),
    },
    -- Git
    ["lewis6991/gitsigns.nvim"] = {
      event = { "BufReadPre" },
      config = utils.config("gitsigns"),
    },
    ["TimUntersberger/neogit"] = {
      cmd = { "Neogit" },
      config = utils.config("neogit"),
    },
    -- Startup
    ["goolord/alpha-nvim"] = {
      opt = false,
      cmd = { "Alpha" },
      module = { "alpha" },
      event = { "VimEnter" },
      wants = { "nvim-web-devicons" },
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
      config = utils.config("alpha"),
    },
    -- Buffer
    ["akinsho/bufferline.nvim"] = {
      tag = "v2.*",
      event = { "BufReadPre" },
      wants = { "nvim-web-devicons" },
      requires = { "kyazdani42/nvim-web-devicons" },
      config = utils.config("bufferline"),
    },
    ["famiu/bufdelete.nvim"] = { cmd = { "Bdelete", "Bwipeout" } },
    -- Status Line
    ["nvim-lualine/lualine.nvim"] = {
      event = { "VimEnter" },
      after = "nvim-treesitter",
      wants = { "nvim-web-devicons" },
      requires = { "kyazdani42/nvim-web-devicons" },
      config = utils.config("lualine"),
    },
    -- Telescope
    ["nvim-telescope/telescope.nvim"] = {
      branch = "0.1.x",
      config = utils.config("telescope"),
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
      },
    },
    ["fannheyward/telescope-coc.nvim"] = {
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension("coc")
      end
    },
    ["ahmedkhalf/project.nvim"] = {
      after = "telescope.nvim",
      config = function()
        require("project_nvim").setup({})
        require("telescope").load_extension("projects")
      end
    },
    -- Code Misc
    ["windwp/nvim-autopairs"] = {
      event = { "InsertEnter" },
      wants = { "nvim-treesitter" },
      config = utils.config("autopairs"),
      requires = {
        "nvim-treesitter/nvim-treesitter",
      },
    },
    ["lukas-reineke/indent-blankline.nvim"] = { event = { "BufReadPre" }, config = utils.config("indent_line") },
    ["numToStr/Comment.nvim"] = {
      module = { "Comment", "Comment.api" },
      keys = { "gc", "gbc", "gcc" },
      config = utils.config("comment"),
    },
    -- LSP
    ["neoclide/coc.nvim"] = {
      event = { "BufReadPre" },
      cmd = { "CocCommand", "CocConfig" },
      branch = "release",
      commit = "b9d65b87cae137c6bf56c6da98331794a970fd25",
      requires = {
        {
          "IngoMeyer441/coc_current_word",
          after = "coc.nvim",
          config = function()
            vim.g.coc_current_word_highlight_delay = 200
          end,
        },
      },
      config = function()
        require("core.lsp").setup()
      end,
    },
    -- Which Key
    ["folke/which-key.nvim"] = {
      event = { "VimEnter" },
      config = utils.config("which_key"),
    },
  }
end)
