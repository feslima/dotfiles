local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  vim.notify("Couldn't load 'toggleterm' plugin!")
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
  },
})

local term_status_ok, term_util = pcall(require, "toggleterm.terminal")
if not term_status_ok then
  vim.notify("Couldn't load 'terminal' submodule of 'toggleterm' plugin!")
  return
end
local Terminal = term_util.Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Exit terminal" })
  end
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
