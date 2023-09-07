local tsserver_organize_imports = function()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
	}

	vim.lsp.buf.execute_command(params)
end

local setup = function(on_attach, capabilities, _)
	return {
		on_attach = on_attach,
		capabilities = capabilities,
		commands = {
			OrganizeImports = {
				tsserver_organize_imports,
				"Organize Imports",
			},
		},
	}
end

return setup
