local vscode = require("vscode-neovim")

vim.opt.clipboard:append("unnamedplus") -- make yank use system clipboard

-- redirect notifications to vscode
vim.notify = vscode.notify

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts) -- make the space key noop
vim.g.mapleader = " " -- remap the literal space as leader key
vim.g.maplocalleader = " " -- remap the literal space as leader key

keymap("n", "<leader>w", function()
	vscode.action("workbench.action.files.save", { when = "editorTextFocus" })
end, vim.tbl_deep_extend("force", opts, { desc = "View files" }))

keymap("n", "<leader>e", function()
	vscode.action("workbench.view.explorer", { when = "editorTextFocus" })
end, vim.tbl_deep_extend("force", opts, { desc = "View files" }))

keymap("n", "<leader>cvd", function()
	vscode.action("editor.action.peekDefinition", {
		when = "editorHasDefinitionProvider && editorTextFocus && !inReferenceSearchEditor && !isInEmbeddedEditor",
	})
end, vim.tbl_deep_extend("force", opts, { desc = "Peek definition" }))

keymap("n", "<leader>cgd", function()
	vscode.action("editor.action.revealDefinition", {
		when = "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor",
	})
end, vim.tbl_deep_extend("force", opts, { desc = "Peek definition" }))

keymap("n", "<leader>x", function()
	vscode.action("workbench.action.closeActiveEditor", {
		when = "!editorTextFocus && !filesExplorerFocus && !searchViewletFocus && !terminalFocus",
	})
end, vim.tbl_deep_extend("force", opts, { desc = "Close active editor" }))

keymap("n", "<leader>t", function()
	vscode.action("workbench.view.testing.focus", {
		when = "editorTextFocus && !filesExplorerFocus && !searchViewletFocus && !terminalFocus && focusedView != 'workbench.view.testing'",
	})
end, vim.tbl_deep_extend("force", opts, { desc = "Open tests view" }))

keymap("n", "<leader>t", function()
	vscode.action("workbench.action.toggleAuxiliaryBar", {
		when = "focusedView == 'workbench.view.testing'",
	})
end, vim.tbl_deep_extend("force", opts, { desc = "Open tests view" }))
