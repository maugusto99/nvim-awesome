return {

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
    "folke/which-key.nvim",
    event = "VeryLazy",
    cond = function() return not vim.g.vscode end,
    config = function()
      require("which-key").setup {}
    end,
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
