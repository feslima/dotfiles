local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("Couldn't import lsp configurations!", "error")
	return
end

require("user.lsp.lsp-installer-config")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
