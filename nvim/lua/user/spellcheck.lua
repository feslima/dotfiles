local status_ok, spellsitter = pcall(require, "spellsitter")
if not status_ok then
	vim.notify("Couldn't load 'spellsitter' plugin!", "error")
end

spellsitter.setup({})

vim.cmd(":set spell")

vim.api.nvim_create_autocmd("TermOpen", { pattern = "term://*", command = "setlocal nospell" })
