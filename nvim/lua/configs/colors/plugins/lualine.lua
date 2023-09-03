local c = require("configs.colortable")
local statusline_bg = c.vscLeftDark

local vscode = {}

vscode.normal = {
	a = { fg = statusline_bg, bg = c.vscMediumBlue, gui = "bold" },
	b = { fg = c.vscMediumBlue, bg = statusline_bg },
	c = { fg = c.vscFront, bg = statusline_bg },
}

vscode.visual = {
	a = { fg = statusline_bg, bg = c.vscUiOrange, gui = "bold" },
	b = { fg = c.vscUiOrange, bg = c.vscNone },
}

vscode.inactive = {
	a = { fg = c.vscFront, bg = statusline_bg, gui = "bold" },
	b = { fg = c.vscContextCurrent, bg = c.vscNone },
	c = { fg = c.vscContextCurrent, bg = c.vscNone },
}

vscode.replace = {
	a = { fg = statusline_bg, bg = c.vscRed, gui = "bold" },
	b = { fg = c.vscRed, bg = c.vscNone },
	c = { fg = c.vscFront, bg = c.vscNone },
}

vscode.insert = {
	a = { fg = statusline_bg, bg = c.vscBlueGreen, gui = "bold" },
	b = { fg = c.vscBlueGreen, bg = c.vscNone },
	c = { fg = c.vscFront, bg = c.vscNone },
}

vscode.terminal = {
	a = { fg = statusline_bg, bg = c.vscBlueGreen, gui = "bold" },
	b = { fg = c.vscFront, bg = c.vscNone },
	c = { fg = c.vscFront, bg = c.vscNone },
}

vscode.command = {
	a = { fg = statusline_bg, bg = c.vscPink, gui = "bold" },
	b = { fg = c.vscPink, bg = c.vscNone },
	c = { fg = c.vscFront, bg = c.vscNone },
}

return vscode
