local status_ok, preview = pcall(require, "goto-preview")
if not status_ok then
	vim.notify("Couldn't load 'goto-preview' plugin!", "error")
	return
end

preview.setup({})
