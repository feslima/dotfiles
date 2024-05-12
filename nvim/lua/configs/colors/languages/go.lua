local setup_colors = function(c)
	return {
		["@function.builtin.go"] = { fg = c.vscYellow, bg = c.vscNone },
		["@function.call.go"] = { fg = c.vscYellow, bg = c.vscNone },
		["@keyword.go"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.import.go"] = { fg = c.vscBlue, bg = c.vscNone },
		["@goImportDeclaration"] = { fg = c.vscPink, bg = c.vscNone },
		["@goImportPackageIdentifier"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@keyword.type.go"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.conditional.go"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.repeat.go"] = { fg = c.vscPink, bg = c.vscNone },
		["@goForRange"] = { fg = c.vscPink, bg = c.vscNone },
		["@module.go"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@namespace.go"] = { fg = c.vscFront, bg = c.vscNone },
		["@parameter.go"] = { fg = c.vscFront, bg = c.vscNone },
		["@property.go"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@variable.go"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@variable.parameter.go"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@variable.member.go"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@operator.go"] = { fg = c.vscFront, bg = c.vscNone },
		["@type.go"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@type.definition.go"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@type.builtin.go"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@repeat.go"] = { fg = c.vscPink, bg = c.vscNone },
		["@string.go"] = { fg = c.vscOrange, bg = c.vscNone },
		["@constructor.go"] = { fg = c.vscYellow, bg = c.vscNone },
		["@constant.go"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@constant.builtin.go"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.coroutine.go"] = { fg = c.vscPink, bg = c.vscNone },
	}
end

return setup_colors
