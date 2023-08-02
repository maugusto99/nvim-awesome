return {

  {
    "nvim-lua/plenary.nvim",
    cond = function()
      return not vim.g.vscode
    end,
  },


}
