local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	vim.notify("Couldn't load 'auto-session' plugin!", "error")
	return
end

auto_session.setup({
	log_level = "info",
})
