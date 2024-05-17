local opts = {
	ensure_installed = {
		-- C/C++
		"clangd",
		"ast-grep",
		"codelldb",

		-- golang stuff
		"gopls",
		"golangci-lint",
		"golangci-lint-langserver",
		"delve",

		-- lua
		"lua-language-server",
		"stylua",

		-- java
		"jdtls", -- requires JDK 17+ installed
		"clang-format",

		-- protobuffs
		"buf-language-server",
		"buf",

		-- python
		"pyright",
		"black",
		"isort",
		"ruff",
		"ruff-lsp",
		"debugpy",

		-- typescript
		"typescript-language-server",
		"prettierd",
		"eslint_d",
		"eslint-lsp",
		"rustywind",

		-- svelte
		"svelte-language-server",

		-- html
		"html-lsp",

		-- CSS
		"css-lsp",

		-- tailwind
		"tailwindcss-language-server",

		-- yaml
		"yaml-language-server",
		"yamlfmt",
	},
}

return opts
