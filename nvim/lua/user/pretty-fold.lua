local status_ok, pretty_fold = pcall(require, "pretty-fold")
if not status_ok then
	vim.notify("Couldn't load 'pretty-fold' plugin!", "error")
	return
end

pretty_fold.setup()
