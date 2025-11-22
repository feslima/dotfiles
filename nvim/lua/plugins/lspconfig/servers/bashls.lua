local setup = function(on_attach, capabilities, _)
	return {
		on_attach = on_attach,
		capabilities = capabilities,
		cmd = { "bash-language-server", "start" },
		filetypes = { "sh", "bash" },
	}
end

return setup
