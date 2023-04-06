return {
  "akinsho/toggleterm.nvim",
  cond = function()
    return not vim.g.vscode
  end,
  event = "VeryLazy",
  config = function()
    local status_ok, toggleterm = pcall(require, "toggleterm")
    if not status_ok then
      return
    end
    toggleterm.setup({
      shade_terminals = false,
      hide_numbers = true, -- hide the number column in toggleterm buffers
      autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
      direction = "float",
      close_on_exit = true, -- close the terminal window when the process exits
      shell = "/bin/fish",
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
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
      -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-w>h", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-w>j", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-w>k", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-w>l", [[<Cmd>wincmd l<CR>]], opts)
    end

    local Terminal = require("toggleterm.terminal").Terminal
    local octave = Terminal:new({ cmd = "octave -q", hidden = true, direction = "horizontal" })

    function _OCTAVE_TOGGLE()
      octave:toggle()
    end

    vim.api.nvim_create_user_command("Send", function(_)
      vim.api.nvim_feedkeys("ggVG", "n", false)
      vim.cmd("ToggleTermSendVisualLines")
    end, {})

    vim.keymap.set("n", "<leader>ot", "<cmd>exe v:count1 . 'ToggleTerm '<cr>", { noremap = true, silent = true })

    vim.keymap.set("n", "<leader>oo", "<cmd>lua _OCTAVE_TOGGLE()<CR>", { noremap = true, silent = true })

    vim.keymap.set("n", "<leader>tr", ":Send<cr>", { noremap = true, silent = true })
  end,
  keys = { "<leader>ot", "<leader>oo", "<leader>gl" },
}
