local opts = {
	ensure_installed = {
		-- golang stuff
		"gopls",
		"golangci-lint",
		"golangci-lint-langserver",
		"delve",

		-- lua
		"lua-language-server",

		-- java
		"jdtls", -- requires JDK 17+ installed
		"google-java-format",

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
		"tailwind-language-server",

		-- yaml
		"yaml-language-server",
		"yamlfmt",
	},
}

return opts
