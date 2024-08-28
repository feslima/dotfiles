local opts = function()
	return {
		adapters = {
			require("neotest-go")({
				args = { "-timeout=30s" },
			}),
			require("neotest-python")({
				runner = "unittest",
				is_test_file = function(file_path)
					return file_path:match("^.+(%..+)$") == ".py"
				end,
			}),
		},
		floating = {
			border = "rounded",
			max_height = 0.8,
			max_width = 0.99,
		},
	}
end

return opts
