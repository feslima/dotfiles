---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		LazyH1 = { bg = c.vscPopupBack, fg = c.vscUiOrange },
		LazyH2 = { fg = c.vscBlue, bg = c.vscNone, bold = true, underline = true },
		LazyButton = { bg = c.vscLeftMid, fg = c.vscFront },
		LazyReasonPlugin = { fg = c.vscDarkYellow },
	}
end

return set_colors
