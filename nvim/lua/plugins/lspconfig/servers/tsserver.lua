local tsserver_organize_imports = function()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
	}

	local clients = vim.lsp.get_clients({ name = "typescript-tools" })

	if #clients == 0 then
		vim.notify("No typescript-tools client found", vim.log.levels.ERROR)
		return
	end
	local client = clients[1]
	client:exec_cmd(params)
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
