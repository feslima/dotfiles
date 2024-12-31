local opts = function()
	local filetypes = require("formatter.filetypes")
	local util = require("formatter.util")

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

	function asm_fmt()
		-- Format assembly files
		return {
			exe = "asmfmt",
			stdin = true,
		}
	end

	function sqlfluff()
		return {
			exe = "sqlfluff",
			args = {
				"format",
				"--disable-progress-bar",
				"--nocolor",
				"-",
			},
			stdin = true,
			ignore_exitcode = false,
		}
	end

	function djlint_fmt()
		local args = {
			"--reformat",
			"--indent=4",
		}
		local ext = util.get_current_buffer_file_extension()
		if ext == "j2" then
			table.insert(args, "--profile=jinja")
			table.insert(args, "--preserve-blank-lines")
		end
		vim.notify(vim.inspect(args))
		return {
			exe = "djlint -",
			args = args,
			stdin = true,
		}
	end

	local configs = {
		filetype = {
			asm = {
				asm_fmt,
			},
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
			sql = {
				sqlfluff,
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
