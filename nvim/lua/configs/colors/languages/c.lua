---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["cDefine"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.import.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.return.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.conditional.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.directive.define.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.repeat.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.modifier.c"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.type.c"] = { fg = c.vscBlue, bg = c.vscNone },
		["@type.builtin.c"] = { fg = c.vscBlue, bg = c.vscNone },
		["@operator.c"] = { fg = c.vscFront, bg = c.vscNone },
		["@variable.c"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.type.macro.c"] = { fg = c.vscBlue, bg = c.vscNone },
		["@lsp.type.property.c"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.type.class.c"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.typemod.variable.declaration.c"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.variable.functionScope.c"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.variable.globalScope.c"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return set_colors
