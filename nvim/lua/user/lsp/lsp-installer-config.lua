local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify("Couldn't load 'lsp-installer' plugin!", "error")
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("Couldn't load 'lspconfig' plugin!", "error")
	return
end

local installed_servers = {
	"sumneko_lua",
	"jsonls",
	"emmet_ls",
	"pyright",
	"tsserver",
	"taplo",
	"dockerls",
	"bashls",
	"vimls",
	"tailwindcss",
	"yamlls",
	"gopls",
	"html",
}
lsp_installer.setup({
	ensure_installed = installed_servers,
})

for _, server in pairs(installed_servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	local has_custom_configs, custom_configs = pcall(require, "user.lsp.settings." .. server)
	if has_custom_configs then
		opts = vim.tbl_deep_extend("force", custom_configs, opts)
	end
	lspconfig[server].setup(opts)
end
