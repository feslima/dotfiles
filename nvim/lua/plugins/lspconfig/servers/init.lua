local get_enabled_servers = function(on_attach, capabilities, util)
	local server_names = {
		"lua_ls",
		"gopls",
		"pyright",
		"golangci_lint_ls",
		"ruff",
		"eslint",
		"yamlls",
		"svelte",
		"html",
		"cssls",
		"bashls",
		"jsonls",
		"tailwindcss",
		"clangd",
		"jdtls",
		"ast_grep",
		"buf_ls",
		"asm_lsp",
		"sqlls",
		"jinja_lsp",
		"emmet_language_server",
	}

	local table = {}
	for _, server in ipairs(server_names) do
		table[server] = require("plugins.lspconfig.servers." .. server)(on_attach, capabilities, util)
	end
	return table
end

return get_enabled_servers
