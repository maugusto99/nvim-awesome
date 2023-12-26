return {
	{
		"numToStr/Comment.nvim",
		version = false, -- Use for stability; omit to use `main` branch for the latest features
		opts = {},
		keys = {
			{ mode = { "n", "v" }, "gc", desc = "Comment Operator" },
		},
	},

	{
		"kylechui/nvim-surround",
		version = false, -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},
}
