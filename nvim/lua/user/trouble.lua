local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	vim.notify("Couldn't load 'trouble' plugin!", "error")
	return
end

trouble.setup({})
