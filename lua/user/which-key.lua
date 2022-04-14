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
  F = { "<cmd>Telescope live_grep<CR>", "Find Text" },
  b = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>", "Navigate buffers" },
  e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
  f = { "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>", "Find files" },
  l = {
    name = "LSP",
    f = { "<cmd>Format<CR>", "Format" },
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<CR>", "Compile" },
    i = { "<cmd>PackerInstall<CR>", "Install" },
    s = { "<cmd>PackerSync<CR>", "Sync" },
    S = { "<cmd>PackerStatus<CR>", "Status" },
    u = { "<cmd>PackerUpdate<CR>", "Update" },
  },
  w = { "<cmd>w<CR>", "Save" },
}
which_key.setup(setup_configs)
which_key.register(mappings, opts)
