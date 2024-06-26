local opts = {
	refresh_delay = 75,
	alpha = 0.75,
	blend_color = "#1E1E1E",
	hide = {
		underline = true,
		virtual_text = true,
		signs = true,
	},
	regex = {
		"[uU]nused",
		"[nN]ever [rR]ead",
		"[nN]ot [rR]ead",
	},
	priority = 128,
	disable = {},
}

return opts
