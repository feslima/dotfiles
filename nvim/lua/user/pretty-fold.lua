local status_ok, pretty_fold = pcall(require, "pretty-fold")
if not status_ok then
	vim.notify("Couldn't load 'pretty-fold' plugin!", "error")
	return
end

local pretty_fold_preview = require("pretty-fold.preview")
pretty_fold.setup({})
pretty_fold_preview.setup({})
