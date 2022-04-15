local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("Couldn't load 'which-key' plugin!")
  return
end

-- https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
local setup_configs = {
  presets = {
    operators = false,
  },
  window = {
    border = "rounded",
  }
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  F = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" },
  P = { "<cmd>Telescope projects<CR>", "Open projects"},
  b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>", "Navigate buffers (Telescope)" },
  c = { "<cmd>Bdelete!<CR>", "Close buffer" },
  e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
  f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", "Find files" },
  g = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<CR>", "List branches" },
    c = { "<cmd>Telescope git_commits<CR>", "List commits" },
    s = { "<cmd>Telescope git_status<CR>", "Show git status" },
    l = { "<cmd> lua _LAZYGIT_TOGGLE()<CR>", "Toggle LazyGitTerminal" },
    h = {
      name = "Hunk operations (Gitsigns)",
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame line" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
      u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" }
    }
  },
  h = { "<cmd>nohlsearch<CR>", "Clear highlight search" },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show code actions" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format buffer" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover information" },
    i = { "<cmd>LspInfo<cr>", "LSP Info" },
    I = { "<cmd>LspInstallInfo<cr>", "LSP Installer Info" },
    q = { "<cmd>lua vim.diagnostic.setloclist()", "Show Quickfix(es) list" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename all references" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Show document symbols (Telescope)" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<CR>", "Compile" },
    i = { "<cmd>PackerInstall<CR>", "Install" },
    s = { "<cmd>PackerSync<CR>", "Sync" },
    S = { "<cmd>PackerStatus<CR>", "Status" },
    u = { "<cmd>PackerUpdate<CR>", "Update" },
  },
  q = { "<cmd>q<CR>", "Quit" },
  s = {
    name = "Search (help, keymaps, etc)",
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    h = { "<cmd>Telescope help_tags<CR>", "List available help tags" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  },
  w = { "<cmd>w<CR>", "Save" },
}
which_key.setup(setup_configs)
which_key.register(mappings, opts)
