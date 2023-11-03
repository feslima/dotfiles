local set_colors = function(c)
	return {
		GitSignsAdd = { fg = c.vscGreen, bg = c.vscNone },
		GitSignsChange = { fg = c.vscYellow, bg = c.vscNone },
		GitSignsDelete = { fg = c.vscRed, bg = c.vscNone },
		GitSignsAddLn = { fg = c.vscBack, bg = c.vscGreen },
		GitSignsChangeLn = { fg = c.vscBack, bg = c.vscYellow },
		GitSignsDeleteLn = { fg = c.vscBack, bg = c.vscRed },
		GitSignsDeletePreview = { fg = c.vscGitDeleted, bg = c.vscNone },
		GitSignsAddPreview = { fg = c.vscGitAdded, bg = c.vscNone },
	}
end

return set_colors
