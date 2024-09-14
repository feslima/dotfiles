local opts = {
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "FormatAutogroup",
			buffer = bufnr,
			command = ":TSToolsSortImports sync",
		})
		vim.lsp.inlay_hint.enable(true)
	end,
	settings = {
		tsserver_file_preferences = {
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayVariableTypeHintsWhenTypeMatchesName = false,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = false,
			includeInlayEnumMemberValueHints = true,
		},
	},
}

return opts
