local status_ok, refactoring = pcall(require, "refactoring")
if not status_ok then
	vim.notify("Couldn't load 'refactoring' plugin!", "error")
	return
end

refactoring.setup({})
