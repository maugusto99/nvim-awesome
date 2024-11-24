return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
	-- 		light_style = "day", -- The theme is used when the background is set to light
	-- 		transparent = false, -- Enable this to disable setting the background color
	-- 		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	-- 		styles = {
	-- 			-- Style to be applied to different syntax groups
	-- 			-- Value is any valid attr-list value for `:help nvim_set_hl`
	-- 			comments = { italic = true },
	-- 			keywords = { italic = true },
	-- 			functions = {},
	-- 			variables = {},
	-- 			-- Background styles. Can be "dark", "transparent" or "normal"
	-- 			sidebars = "dark", -- style for sidebars, see below
	-- 			floats = "dark", -- style for floating windows
	-- 		},
	-- 		day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	-- 		dim_inactive = false, -- dims inactive windows
	-- 		lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("tokyonight").setup(opts)
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end,
	-- },

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		enabled = true,
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
			},
			integrations = {
				cmp = true,
				mini = true,
				notify = true,
				treesitter = true,
				treesitter_context = true,
				noice = true,
				neotree = true,
				telescope = {
					enabled = true,
				},
				mason = true,
				native_lsp = {
					enable = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
		-- First argument is plugin name and the second is the opts table
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
