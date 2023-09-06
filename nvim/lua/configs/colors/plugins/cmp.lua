local set_colors = function(c)
	return {
		CmpPmenu = { link = "Pmenu" },
		CmpBorder = { link = "FloatBorder" },
		CmpSel = { link = "PmenuSel" },
		CmpDoc = { link = "CmpPmenu" },
		CmpDocBorder = { link = "FloatBorder" },
		CmpItemKindField = { fg = c.vscLightBlue, bg = c.vscNone },
		CmpItemKindSnippet = { fg = c.vscAccentBlue, bg = c.vscNone },
		CmpItemKindEnum = { fg = c.vscUiOrange, bg = c.vscNone },
		CmpItemKindVariable = { fg = c.vscLightBlue, bg = c.vscNone },
		CmpItemKindInterface = { fg = c.vscLightBlue, bg = c.vscNone },
		CmpItemKindText = { fg = c.vscOrange, bg = c.vscNone },
		CmpItemKindFunction = { fg = c.vscPink, bg = c.vscNone },
		CmpItemKindMethod = { fg = c.vscPink, bg = c.vscNone },
		CmpItemKindKeyword = { fg = c.vscFront, bg = c.vscNone },
		CmpItemKindProperty = { fg = c.vscBlue, bg = c.vscNone },
		CmpItemKindUnit = { fg = c.vscFront, bg = c.vscNone },
		CmpItemKindConstructor = { fg = c.vscUiOrange, bg = c.vscNone },
		CmpItemMenu = { fg = c.vscPopupFront, bg = c.vscNone },
		CmpItemAbbr = { fg = c.vscFront, bg = c.vscNone },
		CmpItemAbbrDeprecated = { fg = c.vscCursorDark, bg = c.vscPopupBack, strikethrough = true },
		CmpItemAbbrMatch = { fg = c.vscMediumBlue or c.vscDarkBlue, bg = c.vscNone, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = c.vscMediumBlue or c.vscDarkBlue, bg = c.vscNone, bold = true },
	}
end

return set_colors
