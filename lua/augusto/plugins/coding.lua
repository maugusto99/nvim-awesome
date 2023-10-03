return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		keys = {
			{ mode = { "n", "v" }, "gc", desc = "Comment Operator" },
		},
	},

	{
		"echasnovski/mini.bracketed",
		version = false,
		config = function()
			require("mini.bracketed").setup()
		end,
		keys = {
			{ "[", desc = "Prev Operator" },
			{ "]", desc = "Foward Operator" },
		},
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
}
