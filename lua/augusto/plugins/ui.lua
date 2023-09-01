return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = '|',
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = { "mason" },
          },
          ignore_focus = {},
          always_divide_middle = false,
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = { 'filename', 'branch',
            {
              require("noice").api.status.mode.get,
              cond = require("noice").api.status.mode.has,
            }
          },
          lualine_c = { 'fileformat' },
          lualine_x = {},
          lualine_y = { 'filetype', 'progress' },
          lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = { "toggleterm", "quickfix", "man", "lazy", "trouble" },
        winbar = {},
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    cond = function()
      return not vim.g.vscode
    end,
  },
  {
    "echasnovski/mini.hipatterns",
    version = false,
    config = function()
      require("mini.hipatterns").setup()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
    event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    -- stylua: ignore
    keys = {
      {
        "<S-Enter>",
        function() require("noice").redirect(vim.fn.getcmdline()) end,
        mode = "c",
        desc =
        "Redirect Cmdline"
      },
      {
        "<leader>snl",
        function() require("noice").cmd("last") end,
        desc =
        "Noice Last Message"
      },
      {
        "<leader>snh",
        function() require("noice").cmd("history") end,
        desc =
        "Noice History"
      },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      {
        "<c-f>",
        function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
        silent = true,
        expr = true,
        desc =
        "Scroll forward",
        mode = {
          "i", "n", "s" }
      },
      {
        "<c-b>",
        function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
        silent = true,
        expr = true,
        desc =
        "Scroll backward",
        mode = {
          "i", "n", "s" }
      },
    },
    cond = function()
      return not vim.g.vscode
    end,
    dependencies = {
      {
        "rcarriga/nvim-notify",
        keys = {
          {
            "<leader>nd",
            function()
              require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Dismiss all Notifications",
          },
        },
        opts = {
          timeout = 2000,
          max_height = function()
            return math.floor(vim.o.lines * 0.75)
          end,
          max_width = function()
            return math.floor(vim.o.columns * 0.75)
          end,
          background_colour = "NotifyBackground",
          level = 2,
          minimum_width = 50,
          render = "simple",
          stages = "fade",
          top_down = true
        },
      },
      "MunifTanjim/nui.nvim",
    },
    enabled = true,
  },

  {
    "stevearc/dressing.nvim",
    lazy = true,
    enabled = true,
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
          marks = true,      -- shows a list of your marks on ' and `
          registers = true,  -- shows your registers on " in NORMAL or <C-r> in INSERT mode
          spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          },
        },
      })
    end,
  }
}
