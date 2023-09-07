local setup_colors = function(c)
	return {
		["@function.builtin.go"] = { fg = c.vscYellow, bg = c.vscNone },
		["@function.call.go"] = { fg = c.vscYellow, bg = c.vscNone },
		["@keyword.go"] = { fg = c.vscBlue, bg = c.vscNone },
		["@namespace.go"] = { fg = c.vscFront, bg = c.vscNone },
		["@parameter.go"] = { fg = c.vscFront, bg = c.vscNone },
		["@property.go"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@variable.go"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@operator.go"] = { fg = c.vscFront, bg = c.vscNone },
		["@type.go"] = { fg = c.vscFront, bg = c.vscNone },
		["@type.builtin.go"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@repeat.go"] = { fg = c.vscPink, bg = c.vscNone },
		["@string.go"] = { fg = c.vscOrange, bg = c.vscNone },
		["@constructor.go"] = { fg = c.vscYellow, bg = c.vscNone },
	}
end

return setup_colors
