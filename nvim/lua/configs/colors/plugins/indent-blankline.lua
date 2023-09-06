local setup_colors = function(c)
	return {
		IndentBlanklineChar = { fg = c.vscContext, bg = c.vscNone },
		IndentBlanklineSpaceChar = { fg = c.vscContext, bg = c.vscNone },
		IndentBlanklineContextChar = { fg = c.vscContextCurrent, bg = c.vscNone },
		IndentBlanklineContextStart = { bg = c.vscLeftMid },
		IndentBlanklineSpaceCharBlankline = { fg = c.vscContext, bg = c.vscNone },
	}
end

return setup_colors
