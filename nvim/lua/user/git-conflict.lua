local status_ok, git_conflict = pcall(require, "git-conflict")
if not status_ok then
	vim.notify("Couldn't load 'git-conflict' plugin!", "error")
	return
end

git_conflict.setup({
	default_mappings = false,
})
