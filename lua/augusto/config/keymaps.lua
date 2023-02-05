-- Shorten function name
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
-- ctrl c == esc
keymap("i", "<C-c>", "<Esc>", opts)
keymap("i", "jk", "<Esc>", opts)

--Remap space as leader key
keymap("n", "<Space>", "", opts)

-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- Buffer
keymap("n", "<leader>bd", ":bdelete<cr>", opts)
keymap("n", "<leader>bD", ":%bdelete<cr>", opts)
keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)


-- search under cursor
keymap("n", "gw", "*N")
keymap("x", "gw", "*N")
