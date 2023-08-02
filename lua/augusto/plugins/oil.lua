return {
  {
    "stevearc/oil.nvim",
    keys = { { "-", ":Oil<cr>", desc = "Open parent directory" } },
    event = "VeryLazy",
    init = function()
      require("oil").setup({
        view_options = {
          show_hidden = true,
          skip_confirm_for_simple_edits = true,
        },
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
