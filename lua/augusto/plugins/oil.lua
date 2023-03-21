return {
  {
    "stevearc/oil.nvim",
    keys = { { "-", ":Oil<cr>", desc = "Open parent directory" } },
    init = function()
      require("oil").setup({})
    end,
    enabled = true,
  },
}
