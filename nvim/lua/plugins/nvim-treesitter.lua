local opts = {
	ensure_installed = {
		-- defaults
		"vim",
		"lua",

		-- web dev
		"html",
		"css",
		"javascript",
		"jsdoc",
		"typescript",
		"tsx",
		"json",

		-- backend
		"go",
		"python",

		-- miscelaneous
		"make",
		"toml",
		"yaml",
		"dockerfile",
		"bash",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
}

return opts
