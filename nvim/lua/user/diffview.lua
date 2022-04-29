local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
	vim.notify("Couldn't load 'diffview' plugin!", "error")
	return
end

diffview.setup({})
