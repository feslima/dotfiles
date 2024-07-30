---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		markdownBold = { fg = c.vscBlue, bold = true },
		markdownCode = { fg = c.vscOrange, bg = c.vscNone },
		markdownRule = { fg = c.vscBlue, bold = true },
		markdownCodeDelimiter = { fg = c.vscFront, bg = c.vscNone },
		markdownHeadingDelimiter = { fg = c.vscBlue, bg = c.vscNone },
		markdownFootnote = { fg = c.vscOrange, bg = c.vscNone },
		markdownFootnoteDefinition = { fg = c.vscOrange },
		markdownUrl = { fg = c.vscFront, bg = c.vscNone, underline = true },
		markdownLinkText = { fg = c.vscOrange },
		markdownEscape = { fg = c.vscOrange },
		["@markup.raw.block.markdown"] = { fg = c.vscOrange, bg = c.vscNone },
		["@markup.raw.markdown_inline"] = { fg = c.vscOrange, bg = c.vscNone },
	}
end

return set_colors
