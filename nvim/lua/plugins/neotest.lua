local opts = function()
	return {
		adapters = {
			require("neotest-go"),
			require("neotest-python")({
				runner = "unittest",
				is_test_file = function(file_path)
					return file_path:match("^.+(%..+)$") == ".py"
				end,
			}),
		},
	}
end

return opts
