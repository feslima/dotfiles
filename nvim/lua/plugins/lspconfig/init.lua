-- base LSP stuff

---@type vim.diagnostic.Opts
local diag_config = {
	virtual_text = false,
	virtual_lines = { current_line = true },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
		numhl = {},
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(diag_config)

-- Configures the hover feature
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, { buffer = event.buf })
	end,
})

---@param result vim.lsp.CompletionResult|lsp.CompletionParams|nil
---@param ctx table
vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx)
	vim.lsp.buf.signature_help({ border = "rounded" })
end

-- LSP config
local util = require("lspconfig/util")

local on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

local get_server_table = require("plugins.lspconfig.servers")
local server_table = get_server_table(on_attach, capabilities, util)
for server, settings in pairs(server_table) do
	vim.lsp.config(server, settings)
	vim.lsp.enable(server)
end
