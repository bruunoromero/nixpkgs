local plugins = require("core.plugins")

local M = {}

function M.setup(_)
	plugins.register({
		["catppuccin/nvim"] = {
			run = ":CatppuccinCompile",
			as = "catppuccin",
			config = function()
				require("catppuccin").setup({
					flavour = "frappe",
					compile = { enabled = true },
					integrations = { ts_rainbow = true, coc_nvim = false },
				})
			end,
		},
		["nvim-telescope/telescope-frecency.nvim"] = {
			after = "telescope.nvim",
			requires = { "kkharji/sqlite.lua" },
			config = function()
				require("telescope").load_extension("frecency")
			end,
		},
		["tpope/vim-sexp-mappings-for-regular-people"] = {
			requires = {
				{ "guns/vim-sexp" },
				{ "tpope/vim-repeat" },
				{ "tpope/vim-surround" },
			},
		},
		["Olical/conjure"] = {
			ft = { "clojure" },
			config = function()
				vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = "lein repl :headless :port 8794"
				vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
				vim.g["conjure#mapping#doc_word"] = false

				vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = {
					"deftest",
					"defflow",
					"defflow-new-system",
					"defflow-i18n",
					"defspec",
				}
			end,
		},
		["mickael-menu/zk-nvim"] = {
			config = function()
				require("zk").setup({
					picker = "telescope",
					lsp = {
						auto_attatch = {
							enabled = false,
						},
					},
				})
			end,
		},
		["rescript-lang/vim-rescript"] = {
			requires = { "nkrkv/nvim-treesitter-rescript" },
		},
		["MunifTanjim/nui.nvim"] = {},
		["windwp/nvim-spectre"] = {
			requires = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
			config = function()
				require("spectre").setup()
			end,
		},
		["folke/todo-comments.nvim"] = {
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		},
		["weirongxu/plantuml-previewer.vim"] = {
			requires = { "aklt/plantuml-syntax", "tyru/open-browser.vim" },
		},
		["ellisonleao/glow.nvim"] = {
			config = function()
				require("glow").setup({
					border = "rounded",
					width = 120,
				})
			end,
		},
		["sheerun/vim-polyglot"] = {},
		["knubie/vim-kitty-navigator"] = {
			run = "cp ./*.py ~/.config/kitty/",
		},
		["rest-nvim/rest.nvim"] = {
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("rest-nvim").setup({
					result_split_horizontal = false,
					result_split_in_place = false,
					skip_ssl_verification = false,
					encode_url = true,
					highlight = {
						enabled = true,
						timeout = 150,
					},
					result = {
						show_url = true,
						show_http_info = true,
						show_headers = true,
						formatters = {
							json = "jq",
							html = function(body)
								return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
							end,
						},
					},
					jump_to_request = false,
					env_file = ".env",
					custom_dynamic_variables = {},
					yank_dry_run = true,
				})
			end,
		},
		["vim-crystal/vim-crystal"] = {},
		["mg979/vim-visual-multi"] = {},
		["anuvyklack/hydra.nvim"] = {},
		["vim-test/vim-test"] = {},
		["ziontee113/icon-picker.nvim"] = {
			requires = { "stevearc/dressing.nvim" },
			config = function()
				require("icon-picker").setup({
					disable_legacy_commands = true,
				})
			end,
		},
		["jinh0/eyeliner.nvim"] = {
			config = function()
				require("eyeliner").setup {
					highlight_on_key = true,
					dim = true
				}
			end
		}
	})
end

return M
