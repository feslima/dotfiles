local set_colors = function(c)
	return {
		DiffAdd = { fg = c.vscNone, bg = c.vscUiBlue },
		DiffText = { fg = c.vscNone, bg = c.vscDiffGreenDark },
	}
end

return set_colors
