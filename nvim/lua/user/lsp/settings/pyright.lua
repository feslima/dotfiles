local opts = {
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
return opts
