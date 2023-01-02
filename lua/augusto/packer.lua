local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use { 'folke/tokyonight.nvim',
    cond = 'vim.g.vscode == nil',
  }

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  use {'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    cond = 'vim.g.vscode == nil'
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use {'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter'
  }

  use {'p00f/nvim-ts-rainbow',
    after = 'nvim-treesitter'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    cond = 'vim.g.vscode == nil',
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1,
    after = 'telescope.nvim',
  }

  use {
    'debugloop/telescope-undo.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
    after = 'telescope.nvim'
  }

  use({ -- Lualine
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons"},
    cond = 'vim.g.vscode == nil'
  })

  use {'norcalli/nvim-colorizer.lua',
    config =function ()
      require('colorizer').setup()
    end,
    cond = 'vim.g.vscode == nil'
  }

  use {"akinsho/toggleterm.nvim", tag = '*',
    config = function()
      require("toggleterm").setup()
    end,
    cond = 'vim.g.vscode == nil'
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    cond = "vim.g.vscode == nil",
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
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
  }

  if is_bootstrap then
    require('packer').sync()
  end
end)


local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerSync',
  group = packer_group,
  pattern = vim.fn.expand '$XDG_CONFIG_HOME/nvim/lua/augusto/packer.lua',
})
