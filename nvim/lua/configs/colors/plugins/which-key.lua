local set_colors = function(c)
	return {
		WhichKey = { fg = c.vscAccentBlue, bg = c.vscNone },
		WhichKeySeparator = { fg = c.vscSplitLight, bg = c.vscNone },
		WhichKeyDesc = { fg = c.vscFront, bg = c.vscNone },
		WhichKeyGroup = { fg = c.vscYellow, bg = c.vscNone },
	}
end

return set_colors
