return {
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  --       light_style = "day",    -- The theme is used when the background is set to light
  --       transparent = true,     -- Enable this to disable setting the background color
  --       terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  --       styles = {
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         functions = { bold = true },
  --         types = { bold = true, italic = true },
  --         sidebars = "normal",                                -- style for sidebars, see below
  --         floats = "normal",                                  -- style for floating windows
  --       },
  --       sidebars = { "qf", "help", "toggleterm", "trouble" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  --       day_brightness = 0.3,                                 -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  --       hide_inactive_statusline = false,                     -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  --       dim_inactive = false,                                 -- dims inactive windows
  --       lualine_bold = true,                                  -- When `true`, section headers in the lualine theme will be bold
  --     })
  --     vim.o.background = "dark"
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  --   cond = function()
  --     return not vim.g.vscode
  --   end,
  --   enabled = false,
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {
        },
        overrides = {
          SignColumn = { link = "Normal" },
          GruvboxGreenSign = { bg = "" },
          GruvboxOrangeSign = { bg = "" },
          GruvboxPurpleSign = { bg = "" },
          GruvboxYellowSign = { bg = "" },
          GruvboxRedSign = { bg = "" },
          GruvboxBlueSign = { bg = "" },
          GruvboxAquaSign = { bg = "" },
          MatchParen = { fg = "#fabd2f", bg = "", bold=true },
          MatchWord = { fg = "#fabd2f", bg = "", bold=true },
        },
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
