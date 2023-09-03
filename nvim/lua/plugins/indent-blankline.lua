local opts = {
	indentLine_enabled = 1,
	filetype_exclude = {
		"help",
		"terminal",
		"lazy",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"mason",
		"",
		"checkhealth",
		"man",
		"",
		"NvimTree",
		"dapui_scopes",
		"dapui_stacks",
		"dapui_watches",
		"dapui_breakpoints",
		"dapui_hover",
	},
	buftype_exclude = { "terminal", "nofile" },
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
	show_current_context = true,
	show_current_context_start = true,
}

return opts
