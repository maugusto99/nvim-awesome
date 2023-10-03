return {
  "nvim-treesitter/nvim-treesitter",
  cond = vim.g.vscode == nil,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "diff",
        "fish",
        "lua",
        "markdown",
        "markdown_inline",
        "matlab",
        "python",
        "regex",
        "vim",
        "vimdoc",
      },

      ignore_install = { "fortran" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      highlight = {

        -- disable = function(lang, buf)
        --   local max_filesize = 100 * 1024 -- 100 KB
        --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --   if ok and stats and stats.size > max_filesize then
        --     return true
        --   end
        -- end,

        enable = true,
        additional_vim_regex_highlighting = false,
      },
      matchup = {
        enable = true,
        enable_quotes = true,
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
    })
  end,
  build = function()
    pcall(require("nvim-treesitter.install").update({ with_sync = true }))
  end,
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-context" },
  },
}
