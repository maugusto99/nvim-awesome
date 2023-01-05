local status_ok, telescope = pcall(require,"telescope")
if not status_ok then
  return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local action_layout = require("telescope.actions.layout")
local opts = { noremap = true, silent = true }

telescope.setup{

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
      find_command = { "fd", "--strip-cwd-prefix","--type", "f","--no-ignore-vcs"},
      previewer = false
    },

    live_grep = {
      live_grep_command = { "rg" },
    },

    grep_string = {
      grep_string_command = { "rg" },
    }

  },

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    undo = {
      use_delta = true,     -- this is the default
      side_by_side = false, -- this is the default
      mappings = {          -- this whole table is the default
        i = {
          ["<cr>"] = require("telescope-undo.actions").yank_additions,
          ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-cr>"] = require("telescope-undo.actions").restore,
        },
      },
    },
  }
}
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'undo')

vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fF', function() builtin.find_files({hidden = true}) end, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "<leader>u",":Telescope undo<cr>", opts)
vim.keymap.set('n', '<leader>rf', builtin.oldfiles, opts)
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, opts)
