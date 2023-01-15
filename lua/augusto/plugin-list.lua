local plugins = {

  {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      require("augusto.plugin.tokyonight")
    end,
    cond = function() return not vim.g.vscode end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_surround_enabled = 0
    end,
    cond = function() return not vim.g.vscode end,
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    cond = vim.g.vscode == nil,
    config = function()
      require("augusto.plugin.treesitter")
    end,
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
  },

  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require("augusto.plugin.telescope")
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    cond = function() return not vim.g.vscode end,
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1,
  },

  {
    'debugloop/telescope-undo.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("augusto.plugin.lualine")
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
    cond = function() return not vim.g.vscode end
  },

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("augusto.plugin.toggleterm")
    end,
    cond = function() return not vim.g.vscode end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
    config = function()
      require("augusto.plugin.neotree")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cond = function() return not vim.g.vscode end,
  },

  {
    "folke/which-key.nvim",
    cond = function() return not vim.g.vscode end,
    config = function()
      require("which-key").setup {}
    end,
  },

  {
    'williamboman/mason.nvim',
    cond = function() return not vim.g.vscode end,
    config = function()
      require("augusto.plugin.lspconfig")
    end,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  },

}
return plugins
