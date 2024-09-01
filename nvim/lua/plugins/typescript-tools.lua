local opts = {
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "FormatAutogroup",
			buffer = bufnr,
			command = ":TSToolsSortImports sync",
		})
	end,
}

return opts
