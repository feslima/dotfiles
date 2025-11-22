---@return vim.lsp.Config
local setup = function(on_attach, capabilities, util)
	return {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = false,
				analyses = {
					unusedparams = true,
				},
				hints = {
					compositeLiteralFields = true,
					constantValues = true,
					parameterNames = true,
				},
			},
		},
	}
end

return setup
