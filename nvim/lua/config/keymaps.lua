local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Split
keymap("n", "<leader>sh", ":set nospr <bar> vsplit <CR>", opts)
keymap("n", "<leader>sj", ":set sb <bar> split <CR>", opts)
keymap("n", "<leader>sk", ":set nosb <bar> split <CR>", opts)
keymap("n", "<leader>sl", ":set spr <bar> vsplit <CR>", opts)
-- Split navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)
-- "Reset highlight
keymap("n",  "<Leader><Leader>", ":noh<CR>", opts)


-- Visual --
--Align tabular data
keymap("v", "<leader><tab>", ":'<,'>!column -t <CR>", opts)


-- Visual Block --
-- Move text up and down
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)


-- Terminal mode --
keymap("t", ",<Esc>", "<C-\\><C-N>", opts)
