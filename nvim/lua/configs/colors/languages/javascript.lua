---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@include.javascript"] = { fg = c.vscPink, bg = c.vscNone },
		["@variable.javascript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@type.javascript"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@keyword.javascript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.export.javascript"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.coroutine.javascript"] = { fg = c.vscPink, bg = c.vscNone },
		["@attribute.javascript"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@property.javascript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@variable.builtin.javascript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@type.qualifier.javascript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@parameter.javascript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@punctuation.special.javascript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@constant.builtin.javascript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@operator.javascript"] = { fg = c.vscFront, bg = c.vscNone },
		["@conditional.javascript"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.operator.javascript"] = { fg = c.vscBlue, bg = c.vscNone },
		["@constant.javascript"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@exception.javascript"] = { fg = c.vscPink, bg = c.vscNone },
		["@constructor.javascript"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.type.class.javascript"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.type.interface.javascript"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.type.variable.javascript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.property.declaration.javascript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.type.property.javascript"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.variable.readonly.javascript"] = { fg = c.vscAccentBlue, bg = c.vscNone },
	}
end

return set_colors
