local ok, lsp_util = pcall(require, "lspconfig.util")
if not ok then
	vim.notify("Failed to load lspconfi.util!", "error")
end

return {
	root_dir = lsp_util.root_pattern("deno.json", "deno.jsonc"),
}
