local opts = {
	ensure_installed = {
		-- defaults
		"vim",
		"vimdoc",
		"lua",

		-- web dev
		"html",
		"css",
		"javascript",
		"jsdoc",
		"typescript",
		"tsx",
		"json",
		"svelte",

		-- backend
		"go",
		"python",
		"c",
		"java",

		-- miscelaneous
		"make",
		"toml",
		"yaml",
		"dockerfile",
		"bash",
	},
	highlight = {
		enable = true,
	},

	indent = { enable = true },
}

return opts
