return {
  'nvim-telescope/telescope.nvim',
  cond = function() return not vim.g.vscode end,
  config = function()
    local actions = require('telescope.actions')
    local action_layout = require("telescope.actions.layout")
    require("telescope").setup {

      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = {
          height = 0.80,
          prompt_position = "top",
        },

        mappings = {
          n = {
            ["<M-p>"] = action_layout.toggle_preview
          },

          i = {
            ["<C-j>"] = {
              actions.move_selection_next, type = "action",
              opts = { nowait = true, silent = true }
            },
            ["<C-k>"] = {
              actions.move_selection_previous, type = "action",
              opts = { nowait = true, silent = true }
            },
            ["<C-u>"] = false,
            ["<M-p>"] = action_layout.toggle_preview
          }
        }
      },

      pickers = {

        find_files = {
          find_command = { "fd", "--type", "f", "--no-ignore-vcs", "--strip-cwd-prefix" },
        },

        live_grep = {
          live_grep_command = { "rg" },
        },

        grep_string = {
          grep_string_command = { "rg" },
        }

      },

      extensions = {
      }
    }
  end,
  keys = {
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Hidden Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Hidden Files" },
    -- find
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    -- search
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "Diagnostics" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = vim.fn.executable 'make' == 1,
    },
  },
  cond = function() return not vim.g.vscode end,
}
