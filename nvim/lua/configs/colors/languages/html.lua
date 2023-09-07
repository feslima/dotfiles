local setup_colors = function(c)
	return {
		["@constant.html"] = { fg = c.vscBlue, bg = c.vscNone },
		["@tag.html"] = { fg = c.vscBlue, bg = c.vscNone },
		["@tag.attribute.html"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@tag.delimiter.html"] = { fg = c.vscGray, bg = c.vscNone },
		["@text.uri.html"] = { link = "" },
	}
end

return setup_colors
