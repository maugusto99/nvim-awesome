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

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*", "!lazy", "!telescope" },
      buftype = { "*", "!prompt", "!nofile" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- Set the display mode.
        virtualtext = "■",
      },
    },
    cond = function()
      return not vim.g.vscode
    end,
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
    config = function()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    "vifm/vifm.vim",
    cond = function()
      return not vim.g.vscode
    end,
  },
}
