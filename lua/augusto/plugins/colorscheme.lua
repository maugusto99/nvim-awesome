return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("tokyonight").setup({
				style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				light_style = "day", -- The theme is used when the background is set to light
				transparent = false, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = { bold = true },
					variables = {},
					sidebars = "normal", -- style for sidebars, see below
					floats = "normal", -- style for floating windows
				},
				sidebars = { "qf", "help", "toggleterm", "trouble" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
			})
			vim.cmd("colorscheme tokyonight")
		end,
		cond = function()
			return not vim.g.vscode
		end,
		enabled = true,
	},

	{
		"luisiacc/gruvbox-baby",
		enabled = false,
		priority = 1000,
		lazy = false,
		config = function()
			vim.g.gruvbox_baby_highlights = {
				MatchParen = { fg = "#fabd2f", bg = "NONE", style = "bold" },
				MatchWord = { fg = "#fabd2f", bg = "NONE", style = "bold" },
			}
			vim.g.gruvbox_baby_use_original_palette = true
			vim.g.gruvbox_baby_function_style = "bold"
			vim.g.gruvbox_baby_keyword_style = "italic"
			vim.g.gruvbox_baby_background_color = "dark"
			vim.g.gruvbox_baby_telescope_theme = 1
			vim.g.gruvbox_baby_transparent_mode = 0

			-- Load the colorscheme
			vim.cmd([[colorscheme gruvbox-baby]])
		end,
	},
}
