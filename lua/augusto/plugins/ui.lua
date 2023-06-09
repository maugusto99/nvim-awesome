return {
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    config = function()
      require("incline").setup({
        hide = {
          cursorline = true,
          focused_win = true,
          only_win = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
    cond = function()
      return not vim.g.vscode
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "mason" },
          },
          ignore_focus = {},
          always_divide_middle = false,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              file_status = true,
              path = 1,
            },
          },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "neo-tree", "toggleterm", "quickfix", "man", "lazy", "trouble" },
        winbar = {},
      })
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
    event = "VeryLazy",
  },

  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     lsp = {
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --       },
  --     },
  --     presets = {
  --       bottom_search = true,
  --       command_palette = true,
  --       long_message_to_split = true,
  --       lsp_doc_border = true, -- add a border to hover docs and signature help
  --     },
  --   },
  --   -- stylua: ignore
  --   keys = {
  --     {
  --       "<S-Enter>",
  --       function() require("noice").redirect(vim.fn.getcmdline()) end,
  --       mode = "c",
  --       desc =
  --         "Redirect Cmdline"
  --     },
  --     {
  --       "<leader>snl",
  --       function() require("noice").cmd("last") end,
  --       desc =
  --         "Noice Last Message"
  --     },
  --     {
  --       "<leader>snh",
  --       function() require("noice").cmd("history") end,
  --       desc =
  --         "Noice History"
  --     },
  --     { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
  --     {
  --       "<c-f>",
  --       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
  --       silent = true,
  --       expr = true,
  --       desc =
  --         "Scroll forward",
  --       mode = {
  --         "i", "n", "s" }
  --     },
  --     {
  --       "<c-b>",
  --       function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
  --       silent = true,
  --       expr = true,
  --       desc =
  --         "Scroll backward",
  --       mode = {
  --         "i", "n", "s" }
  --     },
  --   },
  --   cond = function()
  --     return not vim.g.vscode
  --   end,
  --   dependencies = {
  --     "rcarriga/nvim-notify",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   enabled = true,
  -- },

  -- {
  --   "stevearc/dressing.nvim",
  --   lazy = true,
  --   enabled = true,
  --   init = function()
  --     vim.ui.select = function(...)
  --       require("lazy").load({ plugins = { "dressing.nvim" } })
  --       return vim.ui.select(...)
  --     end
  --     vim.ui.input = function(...)
  --       require("lazy").load({ plugins = { "dressing.nvim" } })
  --       return vim.ui.input(...)
  --     end
  --   end,
  --   cond = function()
  --     return not vim.g.vscode
  --   end,
  -- },
}
