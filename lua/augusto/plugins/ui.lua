return {
	{
		"nvim-lualine/lualine.nvim",
		opts = function()
			return {
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = "|",
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = { "mason" },
					},
					ignore_focus = {},
					always_divide_middle = false,
					globalstatus = true,
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = "" }, right_padding = 2 },
					},
					lualine_b = {
						"filename",
						"branch",
						{
							require("noice").api.status.mode.get,
							cond = require("noice").api.status.mode.has,
						},
					},
					lualine_c = {
						{
							"diagnostics",
							sources = { "nvim_lsp", "nvim_diagnostic" },
						},
					},
					lualine_x = {},
					lualine_y = { "filetype", "progress" },
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				extensions = { "neo-tree", "toggleterm", "quickfix", "man", "lazy", "trouble" },
			}
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
	},

	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	{
		"echasnovski/mini.hipatterns",
		version = false,
		event = "VeryLazy",
		opts = function()
			local hipatterns = require("mini.hipatterns")
			return {
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			}
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				spelling = {
					enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				},
			},
		},
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			notify = {
				enabled = true,
				view = "mini",
			},
			views = {
				mini = {},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"folke/trouble.nvim",
		cond = function()
			return not vim.g.vscode
		end,
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix list (Trouble)" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Loclist (Trouble)" },
		},
	},
}
