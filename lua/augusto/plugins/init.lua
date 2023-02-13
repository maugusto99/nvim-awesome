return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		event = { "BufRead", "InsertEnter" },
	},

	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
		event = { "BufRead", "InsertEnter" },
	},

	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
			vim.gmatchup_matchparen_deferred = 1
		end,
		event = { "BufWinEnter" },
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		cond = function()
			return not vim.g.vscode
		end,
		config = function()
			require("which-key").setup({})
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
    -- stylua: ignore
    keys = {
      { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end,                  mode = "c",                 desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end,                                    desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end,                                 desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end,                                     desc = "Noice All" },
      { "<c-f>",       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,   silent = true,              expr = true,              desc = "Scroll forward",  mode = { "i", "n", "s" } },
      { "<c-b>",       function() if not require("noice.lsp").scroll( -4) then return "<c-b>" end end, silent = true,              expr = true,              desc = "Scroll backward", mode = { "i", "n", "s" } },
    },
		cond = function()
			return not vim.g.vscode
		end,
		dependencies = {
			"rcarriga/nvim-notify",
		},
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
		cond = function()
			return not vim.g.vscode
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = { "*", "!lazy" },
			buftype = { "*", "!prompt", "!nofile" },
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				AARRGGBB = true, -- 0xAARRGGBB hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				mode = "background", -- Set the display mode.
				virtualtext = "■",
			},
		},
	},

	{
		"jvirtanen/vim-octave",
		cond = function()
			return not vim.g.vscode
		end,
		ft = "octave",
	},
}
