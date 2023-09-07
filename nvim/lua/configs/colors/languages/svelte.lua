local setup_colors = function(c)
	return {
		["@operator.svelte"] = { fg = c.vscFront, bg = c.vscNone },
		["@tag.svelte"] = { fg = c.vscBlue, bg = c.vscNone },
		["@tag.attribute.svelte"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@tag.delimiter.svelte"] = { fg = c.vscGray, bg = c.vscNone },
		["@lsp.typemod.variable.local.svelte"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@lsp.typemod.variable.readonly.svelte"] = { fg = c.vscMediumBlue, bg = c.vscNone },
		["@text.uri.svelte"] = { link = "" },
	}
end

return setup_colors
