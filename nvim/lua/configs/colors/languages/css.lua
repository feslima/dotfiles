---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		["@property.css"] = { fg = c.vscYellowOrange, bg = c.vscNone },
		["@type.css"] = { link = "@property.css" },
		["@attribute.css"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@include.css"] = { fg = c.vscPink, bg = c.vscNone },
	}
end

return set_colors
