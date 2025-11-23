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

		-- Bash
		"bash-language-server",

		-- C/C++
		"clangd",
		"ast-grep",
		"cpptools",

		-- Copilot
		"copilot-language-server",

		-- Docker
		"docker-compose-language-service",
		"dockerfile-language-server",

		-- golang stuff
		"gopls",
		"golangci-lint",
		"golangci-lint-langserver",
		"delve",

		-- JSON
		"json-lsp",

		-- lua
		"lua-language-server",
		"stylua",

		-- java
		"jdtls", -- requires JDK 17+ installed
		"clang-format",

		-- protobuffs
		"buf",

		-- python
		"pyright",
		"black",
		"isort",
		"ruff",
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

		-- toml
		"taplo",

		-- yaml
		"yaml-language-server",
		"yamlfmt",
	},
}

return opts
