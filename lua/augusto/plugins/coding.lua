return {
	{
		"echasnovski/mini.bracketed",
		version = false,
		enabled = false,
		event = "VeryLazy",
		opts = {},
	},

	{
		"echasnovski/mini.surround",
		version = false,
		event = "VeryLazy",
		opts = function()
			vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
		end,
	},

	{
		"echasnovski/mini.comment",
		version = false,
		event = "VeryLazy",
		opts = {},
	},
}
