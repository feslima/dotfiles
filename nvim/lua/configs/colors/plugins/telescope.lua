local set_colors = function(c)
	return {
		TelescopePromptBorder = { fg = c.vscLineNumber, bg = c.vscNone },
		TelescopePromptTitle = { fg = c.vscBack, bg = c.vscGreen },
		TelescopePromptNormal = { fg = c.vscFront, bg = c.vscBack },
		TelescopePromptPrefix = { fg = c.vscFront, bg = c.vscNone },
		TelescopeResultsTitle = { fg = c.vscBack, bg = c.vscBlue },
		TelescopePreviewTitle = { fg = c.vscBack, bg = c.vscDarkYellow },
		TelescopeNormal = { fg = c.vscFront, bg = c.vscNone },
		TelescopeSelection = { fg = c.vscFront, bg = c.vscPopupHighlightBlue },
		TelescopeResultsDiffAdd = { fg = c.vscGitAdded, bg = c.vscNone },
		TelescopeResultsDiffChange = { fg = c.vscGitModified, bg = c.vscNone },
		TelescopeResultsDiffDelete = { fg = c.vscGitDeleted, bg = c.vscNone },
		TelescopeMultiSelection = { fg = c.vscFront, bg = c.vscSelection },
		TelescopeMatching = { fg = c.vscYellowOrange, bg = c.vscNone, bold = true },
		TelescopePreviewBorder = { fg = c.vscLineNumber, bg = c.vscNone },
		TelescopeResultsBorder = { fg = c.vscLineNumber, bg = c.vscNone },
	}
end

return set_colors
