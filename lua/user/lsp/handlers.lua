local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- This will highlight all instances of word/var under cursor depending on context
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		local highlight_group_id = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_clear_autocmds({ pattern = { "*", "<buffer>" }, group = highlight_group_id })
		vim.api.nvim_create_autocmd("CursorHold", {
			group = highlight_group_id,
			pattern = "<buffer>",
			command = "lua vim.lsp.buf.document_highlight()",
			desc = "Highlight ocurrences under cursor in document buffer",
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = highlight_group_id,
			pattern = "<buffer>",
			command = "lua vim.lsp.buf.clear_references()",
			desc = "Clear highlight references on cursor move",
		})
	end
end

local function lsp_keymaps(bufnr) end

M.on_attach = function(client, bufnr)
	local disabled_formatting = { "tsserver", "sumneko_lua", "taplo" }
	if vim.tbl_contains(disabled_formatting, client.name) then
		client.resolved_capabilities.document_formatting = false
	end

	local disabled_range_formatting = { "sumneko_lua" }
	if vim.tbl_contains(disabled_range_formatting, client.name) then
		client.resolved_capabilities.document_range_formatting = false
	end

	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	vim.notify("Couldn't load cmp_nvim_lsp in lsp/handlers.lua!", "error")
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
