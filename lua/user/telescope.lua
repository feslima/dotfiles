local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("Couldn't load telescope plugin!", "error")
	return
end

-- Load telescope extensions here
telescope.load_extension("media_files")
telescope.load_extension("notify")
telescope.load_extension("dap")
telescope.load_extension("termfinder")

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = {
			"node_modules",
			[[\.git]],
			"venv",
			[[\.venv]],
			"package-lock.json",
			"__pycache__",
			[[\.pytest_cache]],
		},

		extensions = {
			media_files = {
				-- filetypes whitelist
				filetypes = { "png", "webp", "jpg", "jpeg" },
				find_cmd = "rg", -- find command (defaults to `fd`)
			},
		},
	},
})
