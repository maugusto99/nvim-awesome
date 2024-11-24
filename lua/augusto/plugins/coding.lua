return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		event = "VeryLazy",
		opts = function()
			vim.keymap.set("x", "S", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
		end,
	},
}
