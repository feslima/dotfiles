local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("Couldn't load 'null-ls' plugin!")
	return
end

-- List of supported formatters/diagnostics can be found in the links below
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier,
    -- diagnostics.eslint,
    formatting.black,
    -- diagnostics.mypy,
    -- formatting.stylua,
    -- formatting.markdownlint,
  },
}
