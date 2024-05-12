local opts = function()
	local filetypes = require("formatter.filetypes")

	local isort = function()
		return {
			exe = "isort",
			args = { "-q", "-", "--profile", "black" },
			stdin = true,
		}
	end

	local rustywind = function()
		return {
			exe = "rustywind",
			args = { "--stdin" },
			stdin = true,
		}
	end

	function clangformat_no_sort()
		-- leave the sorting to jdtls via code actions
		return {
			exe = "clang-format",
			args = { "--style=Google", "--assume-filename=.java", "--sort-includes=false" },
			stdin = true,
		}
	end

	local configs = {
		filetype = {
			c = {
				filetypes.c.clangformat,
			},
			css = {
				filetypes.css.prettierd,
			},
			html = {
				filetypes.html.prettierd,
			},
			java = {
				clangformat_no_sort,
			},
			javascript = {
				filetypes.javascript.prettierd,
				filetypes.javascript.eslint_d,
			},
			javascriptreact = {
				filetypes.javascriptreact.prettierd,
				filetypes.javascriptreact.eslint_d,
				rustywind,
			},
			json = {
				filetypes.json.prettierd,
			},
			jsonc = {
				filetypes.json.prettierd,
			},
			lua = {
				filetypes.lua.stylua,
			},
			go = {
				function()
					return {
						exe = "gofmt",
						stdin = true,
					}
				end,
			},
			proto = {
				filetypes.proto.buf_format,
			},
			python = {
				filetypes.python.black,
				isort,
			},
			svelte = {
				filetypes.svelte.prettier,
				filetypes.typescript.eslint_d,
			},
			typescript = {
				filetypes.typescript.prettierd,
				filetypes.typescript.eslint_d,
			},
			typescriptreact = {
				filetypes.typescriptreact.prettierd,
				filetypes.typescriptreact.eslint_d,
				rustywind,
			},
			yaml = {
				filetypes.yaml.yamlfmt,
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	}
	return configs
end

return opts
