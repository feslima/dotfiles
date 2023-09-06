local setup_colors = function(c)
	return {
		["@include.typescript"] = { fg = c.vscPink, bg = c.vscNone },
		["@variable.typescript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@type.typescript"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@keyword.typescript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.coroutine.typescript"] = { fg = c.vscPink, bg = c.vscNone },
		["@attribute.typescript"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@property.typescript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@variable.builtin.typescript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@type.qualifier.typescript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@parameter.typescript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@punctuation.special.typescript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@constant.builtin.typescript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@operator.typescript"] = { fg = c.vscFront, bg = c.vscNone },
		["@conditional.typescript"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.operator.typescript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@constant.typescript"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@exception.typescript"] = { fg = c.vscPink, bg = c.vscNone },
		["@constructor.typescript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@lsp.type.class.typescript"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.type.interface.typescript"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.typemod.property.declaration.typescript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.type.property.typescript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.variable.readonly.typescript"] = { fg = c.vscAccentBlue, bg = c.vscNone },
	}
end

return setup_colors
