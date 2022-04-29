local status_ok, todo = pcall(require, "todo-comments")
if not status_ok then
	vim.notify("Couldn't load 'todo-comments' plugin!", "error")
	return
end

todo.setup({})
