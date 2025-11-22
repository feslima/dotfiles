local setup = function(on_attach, capabilities, util)
	return {
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "ast-grep", "lsp" },
		filetypes = {
			"c",
			"cpp",
			"rust",
			"go",
			"java",
			"python",
			"javascript",
			"typescript",
			"html",
			"css",
			"kotlin",
			"dart",
			"lua",
		},
		root_dir = util.root_pattern("sgconfig.yaml", "sgconfig.yml"),
	}
end

return setup
