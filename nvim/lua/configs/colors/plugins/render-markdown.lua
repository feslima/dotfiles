---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		ColorColumn = { fg = c.vscNone, bg = c.vscLeftDark },
		RenderMarkdownH1Bg = { fg = c.vscMediumBlue, bg = c.vscNone },
		RenderMarkdownH2Bg = { fg = c.vscMediumBlue, bg = c.vscNone },
		RenderMarkdownH3Bg = { fg = c.vscMediumBlue, bg = c.vscNone },
		RenderMarkdownH4Bg = { fg = c.vscMediumBlue, bg = c.vscNone },
	}
end

return set_colors
