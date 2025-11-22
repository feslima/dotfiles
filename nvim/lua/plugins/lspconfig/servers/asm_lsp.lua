local setup = function(on_attach, capabilities, _)
	return {
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "asm-lsp" },
		filetypes = { "asm", "s", "S" },
	}
end

return setup
