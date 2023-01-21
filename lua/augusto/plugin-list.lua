local plugins = {
  {
    'stevearc/oil.nvim',
    config = function() require('augusto.plugin.oil') end,
    keys = {
      { "<leader>op", "<cmd>Oil<cr>", desc = "Undotree" },
    },
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      require("augusto.plugin.tokyonight")
    end,
    cond = function() return not vim.g.vscode end,
    enabled = true
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    event = "VeryLazy",
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
    event = "BufReadPost",
    config = function()
      require("augusto.plugin.treesitter")
    end,
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'mrjones2014/nvim-ts-rainbow'
    }
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
    "nvim-lualine/lualine.nvim",
    config = function()
      require("augusto.plugin.lualine")
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
    event = "VeryLazy",
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
    "folke/which-key.nvim",
    event = "VeryLazy",
    cond = function() return not vim.g.vscode end,
    config = function()
      require("which-key").setup {}
    end,
  },

  {
    'neovim/nvim-lspconfig',

    cond = function() return not vim.g.vscode end,
    config = function()
      require("augusto.plugin.lspconfig")
    end,
    dependencies = {
      -- LSP Support
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

    },
  },

  {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }

  },

  {
    'mbbill/undotree',
    keys = {
      { "<leader>fu", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2
    end
  },

  {
    "jvirtanen/vim-octave",
    cond = function() return not vim.g.vscode end,
    ft = 'octave'
  },
}

return plugins
