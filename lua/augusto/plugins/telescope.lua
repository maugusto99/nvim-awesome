return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  config = function()
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local trouble = require("trouble.providers.telescope")

    require("telescope").setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        dynamic_preview_title = true,
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.90,
          height = 0.90,
          prompt_position = "top",
          preview_width = 0.6,
        },
        mappings = {
          n = {
            ["<M-p>"] = action_layout.toggle_preview,
            ["<c-t>"] = trouble.open_with_trouble,
          },
          i = {
            ["<c-t>"] = trouble.open_with_trouble,
            ["<C-j>"] = {
              actions.move_selection_next,
              type = "action",
              opts = { nowait = true, silent = true },
            },
            ["<C-k>"] = {
              actions.move_selection_previous,
              type = "action",
              opts = { nowait = true, silent = true },
            },
            ["<C-u>"] = false,
            ["<M-p>"] = action_layout.toggle_preview,
            ["<C-q>"] = function(bufnr)
              actions.smart_send_to_qflist(bufnr)
              require("telescope.builtin").quickfix()
            end,
          },
        },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--no-ignore-vcs", "--strip-cwd-prefix", "--color=never" },
          previewer = false,
        },
        current_buffer_fuzzy_find = {
          previewer = false,
        },
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = false, -- false will only do exact matching
        },
        undo = {
          side_by_side = false,
          layout_config = {
            width = 0.90,
            height = 0.90,
            prompt_position = "top",
            preview_width = 0.8,
          },
        },
      },
    })
    require("telescope").load_extension("undo")
    require("telescope").load_extension("fzf")
  end,
  --stylua: ignore
  keys = {
    { "<leader>:",  "<cmd>Telescope command_history<cr>",               desc = "Command History" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },
    { "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>",        desc = "Find Hidden Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",                     desc = "Grep Project" },
    -- find
    { "<leader>fb", "<cmd>Telescope buffers<cr>",                       desc = "Buffers" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                      desc = "Recent" },
    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>",                   desc = "commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>",                    desc = "status" },
    -- search
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>",               desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>",                      desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope lsp_definitions<cr>",               desc = "Definitions" },
    { "<leader>sr", "<cmd>Telescope lsp_references<cr>",                desc = "References" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>",                     desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>",                    desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>",                       desc = "Key Maps" },
    { "<leader>sm", "<cmd>Telescope marks<cr>",                         desc = "Jump to Mark" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>",                   desc = "Options" },
    { "<leader>u",  "<cmd>Telescope undo<cr>",                          desc = "Undo" },
    { "<leader>Ds", "<cmd>Telescope lsp_document_symbols<cr>",          desc = "[D]ocument [S]ymbols" },
    { "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "[W]orkspace [S]ymbols" },
  },
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable("make") == 1,
    },
    { "debugloop/telescope-undo.nvim" },
  },
  cond = function()
    return not vim.g.vscode
  end,
}
