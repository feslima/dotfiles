local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  vim.notify("Couldn't load 'indent_blankline' plugin!")
  return
end

local global_confs = vim.g
global_confs.indent_blankline_char = "▏"
global_confs.indent_blankline_enabled = true
global_confs.indent_blankline_show_first_indent_level = true
global_confs.indent_blankline_show_trailing_blankline_indent = false
global_confs.indent_blankline_filetype_exclude = {
  "lspinfo",
  "packer",
  "checkhealth",
  "help",
  "man",
  "",
  "alpha",
  "NvimTree"
}
global_confs.indent_blankline_buftype_exclude = { "terminal", "nofile" }

-- These require treesitter installed
global_confs.indent_blankline_use_treesitter = false
global_confs.indent_blankline_show_current_context = false
global_confs.indent_blankline_context_patterns = {
  -- NOTE: look these value in ':help indent-blankline-variables' to see how to enable language specific nodes
  "class",
  "^func",
  "method",
  "^if",
  "while",
  "for",
  "with",
  "try",
  "except",
  "arguments",
  "argument_list",
  "object",
  "dictionary",
  "element",
  "table",
  "tuple",
  -- Javascript nodes
  "jsx_element",

}

indent_blankline.setup {
  -- show_current_context = true,
  -- show_trailing_blankline_indent = false
}
