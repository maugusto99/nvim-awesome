return {
	"nvim-treesitter/nvim-treesitter",
	cond = vim.g.vscode == nil,
	event = { "BufReadPost", "InsertEnter" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"help",
				"regex",
				"python",
				"lua",
				"fortran",
				"bash",
				"fish",
				"vim",
			},
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			-- rainbow = {
			--   enable = true,
			--   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			--   max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- },

			indent = { enable = true },
			matchup = {
				enable = true, -- mandatory, false will disable the whole extension
				-- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
			},
		})
	end,
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
}
