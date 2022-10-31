local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("Couldn't load 'null-ls' plugin!")
	return
end

local lsp_formatting_group_id = vim.api.nvim_create_augroup("LspFormatting", {})

-- List of supported formatters/diagnostics can be found in the links below
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- Code Actions
		-- code_actions.refactoring,

		-- Javascript/Typescript
		formatting.prettier.with({ extra_filetypes = { "xhtml" } }),
		formatting.rustywind, -- [node/npm] shell: npm install -g rustywind
		diagnostics.eslint,

		-- Python
		formatting.black, -- [pyenv/venv] shell: python -m -pip install black
		formatting.isort.with({ extra_args = { "--profile", "black" } }), -- [pyenv/venv] shell: python -m -pip install isort
		diagnostics.flake8, -- [pyenv/venv] shell: python -m -pip install flake8
		-- diagnostics.mypy, -- [pyenv/venv] shell: python -m -pip install mypy

		-- Lua
		formatting.stylua, -- [rust] shell: cargo install stylua

		-- markdown
		formatting.markdownlint, -- [node/npm] shell: npm install -g markdownlint-cli
		diagnostics.markdownlint,

		-- TOML
		formatting.taplo, -- [rust] shell: cargo install taplo-cli

		-- GO
		diagnostics.golangci_lint, -- https://golangci-lint.run/usage/install/
		formatting.gofmt,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = lsp_formatting_group_id, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = lsp_formatting_group_id,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, async = true })
				end,
				desc = "Format on save if client has formatting capabilities",
			})
		end
	end,
})
