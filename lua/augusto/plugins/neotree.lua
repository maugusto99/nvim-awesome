return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  cmd = "Neotree",
  cond = function() return not vim.g.vscode end,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree").setup {
          close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          sort_case_insensitive = false, -- used when sorting files and directories in the tree
          window = {
            position = "float",
            width = 40,
            mapping_options = {
              noremap = true,
              nowait = true,
            },
          },
          filesystem = {
            filtered_items = {
              visible = false, -- when true, they will just be displayed differently than normal items
              hide_dotfiles = false,
              hide_gitignored = true,
            },
            follow_current_file = true, -- This will find and focus the file in the active buffer every
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
          },
          source_selector = {
            winbar = false,
            statusline = false
          },
        }
      end
    end
  end,
  config = function()
    require("neo-tree").setup {
      close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      sort_case_insensitive = false, -- used when sorting files and directories in the tree
      window = {
        position = "float",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      },
      source_selector = {
        winbar = false,
        statusline = false
      },
    }
  end,
  keys = {
    { "<leader>op", ":Neotree float dir=%:p:h <cr>", desc = "File Explorer" }
  },
  cond = function() return not vim.g.vscode end,
}
