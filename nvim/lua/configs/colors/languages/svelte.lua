---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@operator.svelte"] = { fg = c.vscFront, bg = c.vscNone },
		["@tag.svelte"] = { fg = c.vscBlue, bg = c.vscNone },
		["@tag.attribute.svelte"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@tag.delimiter.svelte"] = { fg = c.vscGray, bg = c.vscNone },
		["@lsp.typemod.variable.local.svelte"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.variable.defaultLibrary.svelte"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.variable.readonly.svelte"] = { fg = c.vscMediumBlue, bg = c.vscNone },
		["@lsp.type.class.svelte"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@lsp.type.interface.svelte"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@text.uri.svelte"] = { link = "" },
		["@keyword.svelte"] = { fg = c.vscPink, bg = c.vscNone },
		["@lsp.typemod.property.declaration.svelte"] = { fg = c.vscMediumBlue, bg = c.vscNone },
		["@lsp.type.typeParameter.svelte"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.type.property.svelte"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.method.declaration.svelte"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return set_colors
