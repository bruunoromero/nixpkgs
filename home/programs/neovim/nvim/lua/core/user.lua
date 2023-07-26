local telescope = require("core.telescope")

local user = {
	builtin = {
		notify = {
			enabled = true,
			global = false,
		},
	},
	ft_mappings = {},
	mappings = {
		["<leader>"] = {
			["<leader>"] = { "<cmd>Telescope find_files<cr>", "Find File" },
			["/"] = { "<cmd>Telescope live_grep<cr>", "Search project" },
			["`"] = { "<cmd>b#<cr>", "Switch to last buffer" },
			b = {
				name = "buffer",
				b = { "<cmd> Telescope buffers<cr>", "Switch buffer" },
				d = { "<cmd>Bdelete<cr>", "Kill buffer" },
				D = { "<cmd>bufdo Bdelete<cr>", "Kill all buffers" },
				l = { "<cmd>b#<cr>", "Switch to last buffer" },
				n = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
				p = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" },
			},
			e = {
				name = "editor",
				r = { "<cmd>ReloadConfig<cr>", "Reload" },
				p = {
					name = "plugin",
					p = { "<cmd>PackerSync<cr>", "Sync" },
				},
				q = { "<cmd>qa!<cr>", "Quit" },
			},
			f = {
				name = "file",
				f = { "<cmd>Telescope find_files hidden=true<cr>", "Find File" },
				D = { "<cmd>Delete!<cr>", "Delete this file" },
				n = { "<cmd>ene!<cr>", "New file" },
				r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
			},
			g = {
				name = "git",
				g = { "<cmd>Neogit<cr>", "Git status" },
			},
			l = {
				name = "lsp",
				a = { "<Plug>(coc-codeaction)", "Code action on buffer" },
				c = { "<Plug>(coc-codeaction-cursor)", "Code action at cursor" },
				r = { "<Plug>(coc-rename)", "Rename" },
			},
			o = {
				name = "open",
				p = { "<cmd>CocCommand explorer<cr>", "Project sidebar" },
				t = { "<cmd>ToggleTerm<cr>", "Terminal" },
			},
			p = {
				name = "project",
				p = { "<cmd>Telescope projects<cr>", "Find project" },
			},
			t = {
				name = "task",
				t = { "<cmd>Telescope yabs tasks<cr>", "Execute task" },
			},
			w = {
				name = "window",
				s = { "<cmd>split<cr>", "Split horizontal" },
				v = { "<cmd>vsplit<cr>", "Split vertical" },
			},
		},
	},
	plugins = {
		alpha = {
			active = true,
			config = require("core.alpha").config,
		},
		telescope = {
			active = true,
			config = telescope.config,
		},
		toggleterm = {
			active = true,
			config = {},
		},
		treesitter = {
			active = true,
			path = "nvim-treesitter.configs",
			config = {
				highlight = { enable = true },
				rainbow = { enable = true },
				context_commentstring = { enable = true },
			},
		},
		comment = {
			active = true,
			config = {},
		},
		lualine = {
			active = true,
			config = {
				sections = {
					lualine_y = { "g:coc_status" },
				},
			},
		},
		bufferline = {
			active = true,
		},
		neogit = {
			active = true,
			config = {},
		},
		gitsigns = {
			active = true,
			config = {
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "▎" },
					changedelete = { text = "▎" },
					topdelete = { text = "契" },
				},
			},
		},
		indent_blankline = {
			active = true,
			config = {
				show_end_of_line = true,
				show_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			},
		},
		autopairs = {
			active = true,
			path = "nvim-autopairs",
			config = {
				map_cr = false,
				check_ts = true,
				enable_check_bracket_line = false,
			},
		},
		yabs = {
			active = true,
			path = "core.yabs",
			config = {},
		},
		which_key = {
			active = true,
			path = "which-key",
			config = {
				window = {
					border = "single",
				},
				layout = {
					spacing = 6,
				},
			},
			on_config_done = nil,
		},
	},
}

return user
