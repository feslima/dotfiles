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

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		-- diagnostics.eslint,
		formatting.black, -- [pyenv/venv] shell: python -m -pip install black
		-- diagnostics.mypy, -- [pyenv/venv] shell: python -m -pip install mypy
		formatting.stylua, -- [rust] shell: cargo install stylua

		-- markdown
		formatting.markdownlint, -- [node/npm] shell: npm install -g markdownlint-cli
		diagnostics.markdownlint,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			local lsp_formatting_group_id = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = lsp_formatting_group_id,
				pattern = "<buffer>",
				command = "lua vim.lsp.buf.formatting_sync()",
				desc = "Format on save if client has formatting capabilities",
			})
		end
	end,
})
