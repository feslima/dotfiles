local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- vim keymap alias
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts) -- make the space key noop
vim.g.mapleader = " "                -- remap the literal space as leader key
vim.g.maplocalleader = " "           -- remap the literal space as leader key

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation (for navigation between splits)
keymap("n", "<C-h>", "<C-w>h", opts) -- move to split left of cursor
keymap("n", "<C-j>", "<C-w>j", opts) -- move to split below of cursor
keymap("n", "<C-k>", "<C-w>k", opts) -- move to split above of cursor
keymap("n", "<C-l>", "<C-w>l", opts) -- move to split right of cursor

-- <Space-e> -> Open/Close file explore of current directory
keymap("n", "<leader>e", ":Lex 30<CR>", opts) -- open/close the left explore (Lex) with 30 width

-- Resizing current window with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)             -- resize current window towards top
keymap("n", "<C-Down>", ":resize -2<CR>", opts)           -- resize current window towards bottom
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- resize current window towards right
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)  -- resize current window towards left

-- Navigating buffers with <Space>
keymap("n", "<leader>l", ":bnext<CR>", opts)     -- go to next buffer
keymap("n", "<leader>h", ":bprevious<CR>", opts) -- go to previous buffer

-- Move text up and down
keymap("n", "<A-k>", ":move .-2<CR>==", opts) -- move selected text up one line 
keymap("n", "<A-j>", ":move .+1<CR>==", opts) -- move selected text down one line 

-- Insert --
-- Insert line above cursor
keymap("i", "<C-k>", "<Esc><S-o>", opts)

-- Visual --
-- Move text up and down
keymap("v", "<A-k>", ":move .-2<CR>==", opts) -- move selected text up one line 
keymap("v", "<A-j>", ":move .+1<CR>==", opts) -- move selected text down one line 

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) -- move selected text up one line 
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts) -- move selected text down one line 
