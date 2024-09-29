local setup = function(on_attach, capabilities, util)
	return {
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = false,
				analyses = {
					unusedparams = true,
				},
				["ui.inlayhint.hints"] = {
					compositeLiteralFields = true,
					constantValues = true,
					parameterNames = true,
				},
			},
		},
	}
end

return setup
