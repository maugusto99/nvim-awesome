return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    event = { "BufRead", "InsertEnter" }
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
      })
    end,
    event = { "BufRead", "InsertEnter" }
  },
  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.gmatchup_matchparen_deferred = 1
    end,
    event = { "BufWinEnter" }
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
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
    cond = function() return not vim.g.vscode end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    keys = {
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true,
        desc = "Scroll forward", mode = { "i", "n", "s" } },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,
        expr = true, desc = "Scroll backward", mode = { "i", "n", "s" } },
    },
    cond = function() return not vim.g.vscode end,
  },

  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
    cond = function() return not vim.g.vscode end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    event = "BufReadPre",
    config = function()
      require 'colorizer'.setup()
    end,
    cond = function() return not vim.g.vscode end,
  },

  {
    'mbbill/undotree',
    keys = {
      { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
    config = function()
      vim.g.undotree_WindowLayout = 2
    end,
    cond = function() return not vim.g.vscode end,
  },

  {
    "jvirtanen/vim-octave",
    cond = function() return not vim.g.vscode end,
    ft = 'octave'
  },

}
