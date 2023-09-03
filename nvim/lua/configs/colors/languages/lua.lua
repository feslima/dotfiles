local set_colors = function(c)
	return {
		["@lsp.typemod.function.defaultLibrary.lua"] = { fg = c.vscYellow, bg = c.vscNone },
		["@lsp.type.property.lua"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.typemod.function.declaration.lua"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.variable.declaration.lua"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.type.variable.lua"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.type.function.lua"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.type.method.lua"] = { fg = c.vscYellow, bg = c.vscNone },
		luaSymbolOperator = { fg = c.vscFront, bg = c.vscNone },
		luaOperator = { fg = c.vscFront, bg = c.vscNone },
		luaStatement = { fg = c.vscBlue, bg = c.vscNone },
		luaFunction = { fg = c.vscPink, bg = c.vscNone },
		luaConstant = { fg = c.vscBlue, bg = c.vscNone },
		luaFor = { fg = c.vscPink, bg = c.vscNone },
		luaRepeat = { fg = c.vscPink, bg = c.vscNone },
		luaTable = { fg = c.vscYellow, bg = c.vscNone },
		["@operator.lua"] = { link = "luaOperator" },
		["@keyword.lua"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.function.lua"] = { fg = c.vscPink, bg = c.vscNone },
		["@constant.builtin.lua"] = { fg = c.vscBlue, bg = c.vscNone },
	}
end

return set_colors
