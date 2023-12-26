-- Shorten function name
local keymap = vim.keymap.set

local function description(desc)
	return { noremap = true, silent = true, desc = desc }
end

--Remap space as leader key
vim.g.mapleader = " "
keymap("n", "<Space>", "", description())

-- Do not yank with x
keymap("n", "x", '"_x', description())

-- Buffer
keymap("n", "<leader>bd", ":bdelete<cr>", description())
keymap("n", "<leader>bD", ":%bdelete<cr>", description())
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", description())

keymap("n", "<C-d>", "<C-d>zz", description())
keymap("n", "<C-u>", "<C-u>zz", description())
keymap("n", "n", "nzzzv", description())
keymap("n", "N", "Nzzzv", description())

-- Visual --
-- Stay in indent mode
keymap("v", "J", ":m '>+1<CR>gv=gv", description())
keymap("v", "K", ":m '<-2<CR>gv=gv", description())
--

-- Diagnostics
keymap("n", "<space>q", vim.diagnostic.setloclist, description("Loclist"))
keymap("n", "<space>e", vim.diagnostic.open_float, description("Diagnostic float"))

keymap("t", "<esc>", [[<C-\><C-n>]], description())
keymap("t", "<C-w>h", [[<Cmd>wincmd h<CR>]], description())
keymap("t", "<C-w>j", [[<Cmd>wincmd j<CR>]], description())
keymap("t", "<C-w>k", [[<Cmd>wincmd k<CR>]], description())
keymap("t", "<C-w>l", [[<Cmd>wincmd l<CR>]], description())
