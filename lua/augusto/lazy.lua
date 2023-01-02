local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not vim.loop.fs_stat(lazypath) then
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

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup{

  {
    'folke/tokyonight.nvim',
    lazy = false,
    cond = 'vim.g.vscode == nil',
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    cond = 'vim.g.vscode == nil'
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    cond = 'vim.g.vscode == nil',
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    cond = 'vim.g.vscode == nil',
  },

  {
    'p00f/nvim-ts-rainbow',
    cond = 'vim.g.vscode == nil',
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cond = 'vim.g.vscode == nil',
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1,
  },

  {
    'debugloop/telescope-undo.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons"},
    cond = 'vim.g.vscode == nil'
  },

  {
    'norcalli/nvim-colorizer.lua',
    config =function ()
      require('colorizer').setup()
    end,
    cond = 'vim.g.vscode == nil'
  },

  {
    "akinsho/toggleterm.nvim",
    cond = 'vim.g.vscode == nil'
  },

  {
    'nvim-tree/nvim-tree.lua',
    cond = "vim.g.vscode == nil",
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    },
    cond = 'vim.g.vscode == nil',
  },
}
