---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@javaAssertStatement"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.java"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.operator.java"] = { fg = c.vscPink, bg = c.vscNone },
		["@type.qualifier.java"] = { fg = c.vscBlue, bg = c.vscNone },
		["@operator.java"] = { fg = c.vscFront, bg = c.vscNone },
		["@variable.builtin.java"] = { fg = c.vscBlue, bg = c.vscNone },
		["@lsp.type.class.java"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.type.interface.java"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.type.variable.java"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.annotation.public.java"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.type.enumMember.java"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@lsp.typemod.property.readonly.java"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@lsp.type.property.java"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.class.constructor.java"] = { fg = c.vscYellow, bg = c.vscNone },
		["@lsp.typemod.variable.declaration.java"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return set_colors
