local setup = function(on_attach, capabilities, _)
	return {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	}
end

return setup
