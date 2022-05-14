local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
	vim.notify("Couldn't load 'nvim-spectre' plugin!", "error")
	return
end

spectre.setup({})
