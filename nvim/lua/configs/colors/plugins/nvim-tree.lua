local disable_nvimtree_bg = true

local set_colors = function(c)
	return {
		NvimTreeRootFolder = { fg = c.vscFront, bg = c.vscNone, bold = true },
		NvimTreeGitDirty = { fg = c.vscGitModified, bg = c.vscNone },
		NvimTreeGitNew = { fg = c.vscGitAdded, bg = c.vscNone },
		NvimTreeImageFile = { fg = c.vscViolet, bg = c.vscNone },
		NvimTreeEmptyFolderName = { fg = c.vscGray, bg = c.vscNone },
		NvimTreeFolderName = { fg = c.vscFront, bg = c.vscNone },
		NvimTreeSpecialFile = { fg = c.vscPink, bg = c.vscNone, underline = true },
		NvimTreeNormal = { fg = c.vscFront, bg = disable_nvimtree_bg and c.vscBack or c.vscLeftDark },
		NvimTreeCursorLine = { fg = c.vscNone, bg = disable_nvimtree_bg and c.vscCursorDarkDark or c.vscLeftMid },
		NvimTreeVertSplit = { fg = disable_nvimtree_bg and c.vscSplitDark or c.vscBack, bg = c.vscBack },
		NvimTreeEndOfBuffer = { fg = disable_nvimtree_bg and c.vscCursorDarkDark or c.vscLeftDark },
		NvimTreeOpenedFolderName = { fg = c.vscNone, bg = disable_nvimtree_bg and c.vscCursorDarkDark or c.vscLeftDark },
		NvimTreeGitRenamed = { fg = c.vscGitRenamed, bg = c.vscNone },
		NvimTreeGitIgnored = { fg = c.vscGitIgnored, bg = c.vscNone },
		NvimTreeGitDeleted = { fg = c.vscGitDeleted, bg = c.vscNone },
		NvimTreeGitStaged = { fg = c.vscGitStageModified, bg = c.vscNone },
		NvimTreeGitMerge = { fg = c.vscGitUntracked, bg = c.vscNone },
	}
end

return set_colors
