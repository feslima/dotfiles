---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@include.tsx"] = { fg = c.vscPink, bg = c.vscNone },
		["@variable.tsx"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@type.tsx"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		Type = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@keyword.tsx"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.return.tsx"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.coroutine.tsx"] = { fg = c.vscPink, bg = c.vscNone },
		["@attribute.tsx"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@property.tsx"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@variable.builtin.tsx"] = { fg = c.vscBlue, bg = c.vscNone },
		["@type.qualifier.tsx"] = { fg = c.vscBlue, bg = c.vscNone },
		["@parameter.tsx"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@punctuation.special.tsx"] = { fg = c.vscBlue, bg = c.vscNone },
		["@constant.builtin.tsx"] = { fg = c.vscBlue, bg = c.vscNone },
		["@operator.tsx"] = { fg = c.vscFront, bg = c.vscNone },
		["@conditional.tsx"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.operator.tsx"] = { fg = c.vscBlue, bg = c.vscNone },
		["@constant.tsx"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@exception.tsx"] = { fg = c.vscPink, bg = c.vscNone },
		["@tag.tsx"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@tag.builtin.tsx"] = { fg = c.vscBlue, bg = c.vscNone },
		["@tag.delimiter.tsx"] = { fg = c.vscGray, bg = c.vscNone },
		["@tag.attribute.tsx"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@constructor.tsx"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@none.tsx"] = { fg = c.vscFront, bg = c.vscNone },
		["@lsp.typemod.variable.readonly.typescriptreact"] = { fg = c.vscLightBlue, bg = c.vscNone },
		-- ["@lsp.typemod.function.readonly.typescriptreact"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.function.declaration.typescriptreact"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return set_colors
