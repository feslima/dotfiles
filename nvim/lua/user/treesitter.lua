local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("Couldn't load TreeSitter!", "error")
	return
end

local parser_status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not parser_status_ok then
	vim.notify("Couldn't load TreeSitter parser!", "error")
	return
end

local parser_config = parsers.get_parser_configs()
parser_config.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = { "src/parser.c" },
		branch = "master",
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
	},
	filetype = "gotmpl",
	used_by = { "gotmpl" },
}

configs.setup({
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"go",
		"gomod",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"json",
		"jsonc",
		"lua",
		"make",
		"python",
		"regex",
		"rust",
		"svelte",
		"toml",
		"typescript",
		"tsx",
		"yaml",
	},
	sync_install = false,
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	indent = {
		enable = true,
		disable = {
			"python", -- until https://github.com/nvim-treesitter/nvim-treesitter/issues/1136 is fixed
		},
	},
	rainbow = {
		-- https://github.com/p00f/nvim-ts-rainbow#installation-and-setup
		enable = true,
		extended_mode = false,
	},
	autopairs = {
		-- https://github.com/windwp/nvim-autopairs
		enable = true,
	},
	context_commentstring = {
		-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring#behavior
		enable = true,
		enable_autocmd = false,
	},
})
