local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- vim keymap alias
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts) -- make the space key noop
vim.g.mapleader = " " -- remap the literal space as leader key
vim.g.maplocalleader = " " -- remap the literal space as leader key

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL --
-- Better window navigation (for navigation between splits)
keymap("n", "<C-h>", "<C-w>h", vim.tbl_deep_extend("force", opts, { desc = "Move to window left of cursor" }))
keymap("n", "<C-j>", "<C-w>j", vim.tbl_deep_extend("force", opts, { desc = "Move to window below of cursor" }))
keymap("n", "<C-k>", "<C-w>k", vim.tbl_deep_extend("force", opts, { desc = "Move to window above of cursor" }))
keymap("n", "<C-l>", "<C-w>l", vim.tbl_deep_extend("force", opts, { desc = "Move to window right of cursor" }))

-- Resizing current window with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", vim.tbl_deep_extend("force", opts, { desc = "Resize current window towards top" }))
keymap("n", "<C-Down>", ":resize -2<CR>", vim.tbl_deep_extend("force", opts, { desc = "Resize current window towards bottom" }))
keymap("n", "<C-Right>", ":vertical resize +2<CR>", vim.tbl_deep_extend("force", opts, { desc = "Resize current window towards right" }))
keymap("n", "<C-Left>", ":vertical resize -2<CR>", vim.tbl_deep_extend("force", opts, { desc = "Resize current window towards left" }))

-- Move text up and down
keymap("n", "<A-k>", ":move .-2<CR>==", vim.tbl_deep_extend("force", opts, { desc = "Move line under cursor up one line" }))
keymap("n", "<A-j>", ":move .+1<CR>==", vim.tbl_deep_extend("force", opts, { desc = "Move line under cursor down one line" }))

-- INSERT --
keymap("i", "<C-k>", "<Esc><S-o>", vim.tbl_deep_extend("force", opts, { desc = "Insert line above cursor" }))

-- VISUAL --
-- Move text up and down
keymap("v", "<A-k>", ":move .-2<CR>==", vim.tbl_deep_extend("force", opts, { desc = "Move selected lines up one line" }))
keymap("v", "<A-j>", ":move .+1<CR>==", vim.tbl_deep_extend("force", opts, { desc = "Move selected lines down one line" }))

-- VISUAL BLOCK --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", vim.tbl_deep_extend("force", opts, { desc = "Move selected block up one line" }))
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", vim.tbl_deep_extend("force", opts, { desc = "Move selected block down one line" }))
