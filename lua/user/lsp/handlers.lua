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

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap

	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- Go to declaration under cursor
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition under cursor
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) --
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- 'gl' in normal mode shows the line diagnostics under cursor
	keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float(0, { border = "rounded" })<CR>', opts)
	-- go to next diagnostic line and open the float
	keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" }})<CR>', opts)
	-- go to previous diagnostic line and open the float
	keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" }})<CR>', opts)
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		-- configurations specific to the TypeScript server
		client.resolved_capabilities.document_formatting = false
	end

	if client.name == "sumneko_lua" then
		client.resolved_capabilities.document_formatting = false
	end

	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	vim.notify("Couldn't load cmp_nvim_lsp in lsp/handlers.lua!")
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
