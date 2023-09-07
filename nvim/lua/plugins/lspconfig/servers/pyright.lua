local setup = function(on_attach, capabilities, util)
	return {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "python" },
		root_dir = util.root_pattern("pyproject.toml", ".git"),
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	}
end

return setup
