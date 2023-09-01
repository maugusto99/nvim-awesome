return {
  "akinsho/toggleterm.nvim",
  enabled = true,
  cond = function()
    return not vim.g.vscode
  end,
  config = function()
    require("toggleterm").setup({
      shade_terminals = false,
      hide_numbers = true,      -- hide the number column in toggleterm buffers
      autochdir = true,         -- when neovim changes it current directory the terminal will change it's own when next it's opened
      start_in_insert = true,
      insert_mappings = true,   -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
      direction = "horizontal",
      close_on_exit = true,     -- close the terminal window when the process exits
      shell = "/bin/fish",
      auto_scroll = true,       -- automatically scroll to the bottom on terminal output
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        border = "rounded",
      },
      -- like `size`, width and height can be a number or function which is passed the current terminal
      winbar = {
        enabled = false,
      },
      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()"),
    })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-w>h", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-w>j", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-w>k", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-w>l", [[<Cmd>wincmd l<CR>]], opts)
    end

    local terminal = require("toggleterm")
    local ft_cmds = {
      python = "python3 " .. vim.fn.expand('%'),
      matlab = "octave --no-line-editing -q " .. vim.fn.expand('%'),
    }

    vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>p", function()
        terminal.exec(ft_cmds[vim.bo.filetype])
      end,
      { noremap = true, silent = true }
    )
  end,

  keys = {
    { "<leader>t", desc = "Toggle Terminal" },
    { "<leader>p", desc = "Execute buffer" }
  },

}
