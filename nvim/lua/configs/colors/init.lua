local hl = vim.api.nvim_set_hl

local colors_modules = {
	"base",
	"lsp",
	"languages.base",
	"languages.asm",
	"languages.c",
	"languages.cpp",
	"languages.css",
	"languages.dockerfile",
	"languages.go",
	"languages.html",
	"languages.lua",
	"languages.java",
	"languages.javascript",
	"languages.make",
	"languages.markdown",
	"languages.proto",
	"languages.python",
	"languages.typescript",
	"languages.typescriptreact",
	"languages.svelte",
	"languages.yaml",
	"plugins.cmp",
	"plugins.indent-blankline",
	"plugins.git-conflict",
	"plugins.git-signs",
	"plugins.lazy",
	"plugins.nvim-notify",
	"plugins.nvim-tree",
	"plugins.octo",
	"plugins.render-markdown",
	"plugins.telescope",
	"plugins.which-key",
}

local c = require("configs.colortable")

for _, module in ipairs(colors_modules) do
	local set_colors = require("configs.colors." .. module)
	local color_table = set_colors(c)
	for group, configs in pairs(color_table) do
		hl(0, group, configs)
	end
end

-- delete unwanted groups
vim.cmd("hi clear @spell")
