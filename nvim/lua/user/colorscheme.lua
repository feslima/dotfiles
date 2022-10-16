vim.o.background = "dark"

-- Check if the theme defined in colorscheme can be loaded, if not notify that the scheme is missing
local status_ok, vscode = pcall(require, "vscode")
if not status_ok then
	vim.notify("Couldn't load vscode colorscheme plugin!", "error")
	return
end

vscode.setup({
	italic_comments = false,
})
