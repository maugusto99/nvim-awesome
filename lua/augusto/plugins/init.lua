return {

  {
    "nvim-lua/plenary.nvim",
    cond = function()
      return not vim.g.vscode
    end,
  },

  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.gmatchup_matchparen_deferred = 1
    end,
    event = { "BufWinEnter" },
    cond = function()
      return not vim.g.vscode
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    cond = function()
      return not vim.g.vscode
    end,
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 600
      require("which-key").setup({
        plugins = {
          marks = false, -- shows a list of your marks on ' and `
          registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          },
        },
      })
    end,
  },

}
