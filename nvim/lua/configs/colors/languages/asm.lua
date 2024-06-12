---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@function.builtin.asm"] = { fg = c.vscYellow, bg = c.vscNone },
		["@variable.builtin.asm"] = { fg = c.vscLightBlue, bg = c.vscNone },
	}
end

return set_colors
