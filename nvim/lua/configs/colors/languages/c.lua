local set_colors = function(c)
	return {
		["@keyword.import.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.return.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.conditional.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.directive.define.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.repeat.c"] = { fg = c.vscPink, bg = c.vscNone },
		["@type.builtin.c"] = { fg = c.vscBlue, bg = c.vscNone },
		["@operator.c"] = { fg = c.vscFront, bg = c.vscNone },
		["@lsp.type.macro.c"] = { fg = c.vscBlue, bg = c.vscNone },
	}
end

return set_colors
