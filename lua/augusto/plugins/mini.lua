return {
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup()
		end,
		event = { "BufRead", "InsertEnter" },
	},

	{
		"echasnovski/mini.bracketed",
		version = false,
		config = function()
			require("mini.bracketed").setup()
		end,
		event = "BufReadPost",
	},

	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
		event = { "BufRead", "InsertEnter" },
	},
}
