-- Shorten function name
local keymap = vim.keymap.set

local function set_description(desc)
	return { noremap = true, silent = true, desc = desc }
end

--Remap space as leader key
vim.g.mapleader = " "
keymap("n", "<Space>", "", set_description())

-- Do not yank with x
keymap("n", "x", '"_x', set_description())

-- Buffer
keymap("n", "<leader>bd", ":bdelete<cr>", set_description("Delete Buffer"))
keymap("n", "<leader>bD", ":%bdelete<cr>", set_description())
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", set_description("Set file dir as root dir"))

keymap("n", "<C-d>", "<C-d>zz", set_description())
keymap("n", "<C-u>", "<C-u>zz", set_description())
keymap("n", "n", "nzzzv", set_description())
keymap("n", "N", "Nzzzv", set_description())

-- Visual --
-- Stay in indent mode
keymap("v", "J", ":m '>+1<CR>gv=gv", set_description())
keymap("v", "K", ":m '<-2<CR>gv=gv", set_description())

-- Diagnostics
keymap("n", "<space>q", vim.diagnostic.setloclist, set_description("Loclist"))
keymap("n", "<space>e", vim.diagnostic.open_float, set_description("Diagnostic float"))

-- Terminal
keymap("t", "<esc>", [[<C-\><C-N>]], set_description())
keymap("t", "<C-w>h", [[<Cmd>wincmd h<CR>]], set_description())
keymap("t", "<C-w>j", [[<Cmd>wincmd j<CR>]], set_description())
keymap("t", "<C-w>k", [[<Cmd>wincmd k<CR>]], set_description())
keymap("t", "<C-w>l", [[<Cmd>wincmd l<CR>]], set_description())
