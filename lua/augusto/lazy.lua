local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "augusto.plugins" },
	},
	ui = {
		border = "none",

		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
	},
	install = {
		colorscheme = { "tokyonight", "catppuccin" },
	},
	checker = { enabled = false }, -- automatically check for plugin updates
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			paths = {}, -- add any custom paths here that you want to indluce in the rtp
			disabled_plugins = {
				"gzip",
				"tutor",
				"zipPlugin",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				-- "matchit",
				-- "matchparen",
			},
		},
	},
})

vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")
