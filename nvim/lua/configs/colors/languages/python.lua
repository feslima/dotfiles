---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@attribute.python"] = { fg = c.vscYellow, bg = c.vscNone },
		["@attribute.builtin.python"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@boolean.python"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@variable.python"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@include.python"] = { fg = c.vscPink, bg = c.vscNone },
		["@type.python"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@parameter.python"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@operator.python"] = { fg = c.vscFront, bg = c.vscNone },
		["@constructor.init-definition.python"] = { fg = c.vscYellow, bg = c.vscNone },
		["@keyword.python"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.import.python"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.type.python"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.conditional.python"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.operator.python"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.return.python"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.exception.python"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.repeat.python"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.with"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.as"] = { fg = c.vscPink, bg = c.vscNone },
		["@keyword.in"] = { fg = c.vscPink, bg = c.vscNone },
		["@module.import"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@module.function.call.python"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@variable.builtin.python"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@variable.member.python"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@variable.parameter.python"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@string.interpolation.start"] = { fg = c.vscBlue, bg = c.vscNone },
		["@constant.python"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@constant.builtin.python"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@constructor.python"] = { link = "@type.python" },
		["@repeat.python"] = { link = "pythonRepeat" },
		["@exception.python"] = { fg = c.vscPink, bg = c.vscNone },
		["@function.method.call.python"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@function.call.python"] = { fg = c.vscYellow, bg = c.vscNone },
		["@function.builtin.python"] = { fg = c.vscYellow, bg = c.vscNone },
	}
end

return set_colors
