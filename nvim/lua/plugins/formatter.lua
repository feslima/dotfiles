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

	local configs = {
		filetype = {
			css = {
				filetypes.css.prettierd,
			},
			html = {
				filetypes.html.prettierd,
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
			python = {
				filetypes.python.black,
				isort,
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
