local status_ok, telescope = pcall(require,"telescope")
if not status_ok then
  return
end

local actions = require('telescope.actions')

telescope.setup{

  defaults = {
    -- previewer = false,
    prompt_prefix = "  ",
    selection_caret = " ",
    -- layout_strategy = "vertical",
    sorting_strategy = "ascending",
    layout_config = {
      height = 0.90,
      prompt_position = "top",
    },

    mappings = {
      i = {
        ["<C-j>"] = {
          actions.move_selection_next, type = "action",
          opts = { nowait = true, silent = true }
        },
        ["<C-k>"] = {
          actions.move_selection_previous, type = "action",
          opts = { nowait = true, silent = true }
        },
      }
    }
  },

  pickers = {

    find_files = {
      find_command = { "fd", "--strip-cwd-prefix","--type", "f","--no-ignore-vcs"},
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
  },
}

require('telescope').load_extension('fzf')
