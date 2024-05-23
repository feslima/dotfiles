---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		pythonInclude = { fg = c.vscPink, bg = c.vscNone },
		pythonAttribute = { fg = c.vscPink, bg = c.vscNone },
		pythonRepeat = { fg = c.vscPink, bg = c.vscNone },
		pythonOperator = { fg = c.vscPink, bg = c.vscNone },
		pythonStatement = { fg = c.vscPink, bg = c.vscNone },
		pythonFunction = { fg = c.vscYellow, bg = c.vscNone },
		["@variable.python"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@include.python"] = { fg = c.vscPink, bg = c.vscNone },
		["@type.python"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@parameter.python"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@operator.python"] = { fg = c.vscFront, bg = c.vscNone },
		["@keyword.python"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.operator.python"] = { link = "pythonOperator" },
		["@variable.builtin.python"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@constant.python"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@constant.builtin.python"] = { fg = c.vscAccentBlue, bg = c.vscNone },
		["@constructor.python"] = { link = "@type.python" },
		["@repeat.python"] = { link = "pythonRepeat" },
		["@exception.python"] = { fg = c.vscPink, bg = c.vscNone },
		["@function.call.python"] = { fg = c.vscYellow, bg = c.vscNone },
		["@function.builtin.python"] = { fg = c.vscYellow, bg = c.vscNone },
		["@attribute.python"] = { fg = c.vscYellow, bg = c.vscNone },
	}
end

return set_colors
