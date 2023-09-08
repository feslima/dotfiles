local setup_colors = function(c)
	return {
		["@property.css"] = { fg = c.vscYellowOrange, bg = c.vscNone },
		["@type.css"] = { link = "@property.css" },
		["@attribute.css"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return setup_colors
