local set_colors = function(c)
	local M = {}

	local base = {
		Normal = { fg = c.vscNone, bg = c.vscBack },
		Visual = { fg = c.vscNone, bg = c.vscSelection },
		Comment = { fg = c.vscGreen, bg = c.vscNone },
		String = { fg = c.vscOrange, bg = c.vscNone },
		Identifier = { fg = c.vscLightBlue, bg = c.vscNone },
		Number = { fg = c.vscLightGreen, bg = c.vscNone },
		Boolean = { fg = c.vscBlue, bg = c.vscNone },
		Conditional = { fg = c.vscPink, bg = c.vscNone },
		CursorLine = { fg = c.vscNone, bg = c.vscLeftDark },
		CursorColumn = { link = "CursorLine" },
		SignColumn = { fg = c.vscNone, bg = c.vscBack },
		LineNr = { fg = c.vscLineNumber, bg = c.vscBack },
		CursorLineNr = { fg = c.vscPopupFront, bg = c.vscBack },
		Search = { fg = c.vscNone, bg = c.vscSearch },
		EndOfBuffer = { fg = c.vscBack, bg = c.vscNone },
		Directory = { fg = c.vscBlue, bg = c.vscBack },
		ErrorMsg = { fg = c.vscRed, bg = c.vscBack },
		Title = { fg = c.vscFront, bg = c.vscNone, bold = true },
		NonText = { fg = c.vscLineNumber, bg = c.vscNone },
		Type = { fg = c.vscBlue, bg = c.vscNone },
		Statement = { fg = c.vscPink, bg = c.vscNone },

		-- DiagnosticUnnecessary = { blend = 50 },

		-- floating windows
		NormalFloat = { fg = c.vscPopupFront, bg = c.vscBack },
		FloatBorder = { fg = c.vscSplitDark, bg = c.vscNone },

		-- Pmenu
		Pmenu = { link = "NormalFloat" },
		PmenuSel = { fg = c.vscNone, bg = c.vscSelection },
	}

	local lsp_semantic_tokens = {
		["@lsp.type.property"] = { fg = c.vscFront, bg = c.vscNone },
	}

	local syntax = {
		["@namespace"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@include"] = { fg = c.vscBlue, bg = c.vscNone, link = "" },
		["@string"] = { fg = c.vscOrange, bg = c.vscNone },
		["@variable"] = { fg = c.vscFront, bg = c.vscNone },
		["@field"] = { fg = c.vscLightBlue, bg = c.vscNone },
		["@property"] = { fg = c.vscFront, bg = c.vscNone },
		["@function"] = { fg = c.vscYellow, bg = c.vscNone },
		["@method"] = { fg = c.vscYellow, bg = c.vscNone },
		["@method.call"] = { fg = c.vscYellow, bg = c.vscNone },
		["@function.call"] = { fg = c.vscYellow, bg = c.vscNone },
		["@string.escape"] = { fg = c.vscYellow, bg = c.vscNone },
		["@keyword"] = { fg = c.vscYellow, bg = c.vscNone },
		["@keyword.function"] = { fg = c.vscBlue, bg = c.vscNone },
		["@keyword.return"] = { fg = c.vscPink, bg = c.vscNone },
		["@spell"] = { fg = c.vscGreen, bg = c.vscNone, link = "" },
		["@comment"] = { link = "Comment" },
		["@comment.documentation"] = { link = "Comment" },
		["@number"] = { fg = c.vscLightGreen, bg = c.vscNone },
		["@float"] = { fg = c.vscLightGreen, bg = c.vscNone },
		["@boolean"] = { fg = c.vscBlue, bg = c.vscNone },
		["@punctuation.delimiter"] = { fg = c.vscFront, bg = c.vscNone },
		["@punctuation.bracket"] = { fg = c.vscDarkYellow, bg = c.vscNone },
		["@type"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@type.builtin"] = { fg = c.vscBlueGreen, bg = c.vscNone },
		["@repeat"] = { fg = c.vscPink, bg = c.vscNone },
	}

	M = vim.tbl_deep_extend("force", M, base)
	M = vim.tbl_deep_extend("force", M, lsp_semantic_tokens)
	M = vim.tbl_deep_extend("force", M, syntax)

	return M
end
return set_colors
