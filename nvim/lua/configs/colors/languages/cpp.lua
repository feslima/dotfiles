local set_colors = function(c)
	return {
		["@operator.cpp"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.directive.cpp"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.directive.define.cpp"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.type.cpp"] = { fg = c.vscBlue, bg = c.vscNone },
		["@type.builtin.cpp"] = { fg = c.vscBlue, bg = c.vscNone },
		["@lsp.type.macro.cpp"] = { fg = c.vscBlue, bg = c.vscNone },
		["@lsp.type.class.cpp"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.type.property.cpp"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return set_colors
