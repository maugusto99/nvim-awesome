return {
  "nvim-treesitter/nvim-treesitter",
  cond = vim.g.vscode == nil,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "regex",
        "diff",
        "python",
        "lua",
        "bash",
        "fish",
        "vim",
        "matlab",
        "markdown",
        "markdown_inline",
      },
      ignore_install = { "fortran" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = { enable = true, enable_autocmd = false },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      indent = { enable = true },
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
      },
    })
  end,
  build = function()
    pcall(require("nvim-treesitter.install").update({ with_sync = true }))
  end,
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-context", }
  },

}
