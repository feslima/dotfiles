local set_colors = function(c)
	return {
		DiffAdd = { fg = c.vscNone, bg = c.vscDiffGreenLight },
		DiffChange = { fg = c.vscNone, bg = c.vscDiffRedDark },
		DiffDelete = { fg = c.vscNone, bg = c.vscDiffRedLight },
		DiffText = { fg = c.vscNone, bg = c.vscDiffRedLight },
	}
end

return set_colors
