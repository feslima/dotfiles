local set_colors = function(c)
	return {
		DiagnosticError = { fg = c.vscRed, bg = c.vscNone },
		DiagnosticWarn = { fg = c.vscDarkYellow, bg = c.vscNone },
		DiagnosticInfo = { fg = c.vscAccentBlue, bg = c.vscNone },
		DiagnosticHint = { fg = c.vscPink, bg = c.vscNone },
		DiagnosticUnderlineError = { fg = c.vscNone, bg = c.vscNone, undercurl = true, sp = c.vscRed },
		DiagnosticUnderlineWarn = { fg = c.vscNone, bg = c.vscNone, undercurl = true, sp = c.vscYellow },
		DiagnosticUnderlineInfo = { fg = c.vscNone, bg = c.vscNone, undercurl = true, sp = c.vscBlue },
		DiagnosticUnderlineHint = { fg = c.vscNone, bg = c.vscNone, undercurl = true, sp = c.vscBlue },
		LspReferenceText = { fg = c.vscNone, bg = c.vscPopupHighlightGray },
		LspReferenceRead = { fg = c.vscNone, bg = c.vscPopupHighlightGray },
		LspReferenceWrite = { fg = c.vscNone, bg = c.vscPopupHighlightGray },
	}
end

return set_colors
