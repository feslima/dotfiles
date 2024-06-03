---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@string.special.symbol.make"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@function.builtin.make"] = { fg = c.vscYellow, bg = c.vscNone },
		["@function.builtin.bash"] = { fg = c.vscYellow, bg = c.vscNone },
		["@operator.make"] = { fg = c.vscOrange, bg = c.vscNone },
		["@variable.make"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return set_colors
