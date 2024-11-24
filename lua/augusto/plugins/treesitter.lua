return {
	"nvim-treesitter/nvim-treesitter",
	cond = (vim.g.vscode == nil),
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"diff",
				"fish",
				"lua",
				"markdown",
				"markdown_inline",
				"matlab",
				"python",
				"query",
				"regex",
				"vim",
				"vimdoc",
			},

			patern = {
				[".*/kitty/.+%.conf"] = "bash",
			},
			-- ignore_install = { "fortran" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
			indent = { enable = true },
		})
	end,
	build = function()
		pcall(require("nvim-treesitter.install").update({ with_sync = true }))
	end,
	dependencies = {},
}
