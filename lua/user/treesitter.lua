local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("Couldn't load TreeSitter!")
  return
end

configs.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true },
  rainbow = {
    -- https://github.com/p00f/nvim-ts-rainbow#installation-and-setup
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}