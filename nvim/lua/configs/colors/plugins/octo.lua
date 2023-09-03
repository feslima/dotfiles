local set_colors = function(c)
	return {
		DiffAdded = { fg = c.vscNone, bg = c.vscDiffGreenLight },
		DiffRemoved = { fg = c.vscNone, bg = c.vscDiffRedLight },
	}
end

return set_colors
