local opts = {
	ensure_installed = {
		-- miscelaneous
		"harper-ls",

		-- templating
		"jinja-lsp",
		"djlint",

		-- Assembly - RISC-V
		"asm-lsp",
		"asmfmt",

		-- C/C++
		"clangd",
		"ast-grep",
		"cpptools",

		-- Docker
		"docker-compose-language-service",
		"dockerfile-language-server",

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

		-- SQL
		"sqlls",
		"sqlfluff",

		-- svelte
		"svelte-language-server",

		-- html
		"html-lsp",
		"emmet-language-server",

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
