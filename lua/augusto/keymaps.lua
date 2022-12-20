-- Shorten function name
local keymap = vim.keymap.set
-- local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- ctrl c == esc
keymap("i", "<C-c>", "<Esc>")

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable arrow keys normal mode
keymap("n","<left>","<nop>",opts)
keymap("n","<up>","<nop>",opts)
keymap("n","<down>","<nop>",opts)
keymap("n","<right>","<nop>",opts)

-- Disable arrow keys insert mode
keymap("i","<up>","<nop>",opts)
keymap("i","<left>","<nop>",opts)
keymap("i","<down>","<nop>",opts)
keymap("i","<right>","<nop>",opts)

-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- netrw 
keymap("n", "<leader>op", ':Explore<cr>', opts)

-- Buffer
keymap("n", "<leader>bk", ":bdelete<cr>", opts)
keymap("n", "<leader>bK", ":%bdelete<cr>", opts)
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Visual --
-- Stay in indent mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fF", ":Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>fz", ":Telescope current_buffer_fuzzy_find<CR>", opts)

keymap("n", "<leader>gs", vim.cmd.Git, opts)
keymap("n", "<leader>u", vim.cmd.UndotreeToggle, opts)
