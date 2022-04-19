local g = vim.g

g.ultest_icons = 1
g.ultest_pass_sign = ""
g.ultest_fail_sign = ""
g.ultest_running_sign = ""
g.ultest_not_run_sign = ""

local status_ok, ultest = pcall(require, "ultest")
if not status_ok then
	vim.notify("Couldn't load 'vim-ultest' plugin!", "error")
	return
end

ultest.setup({
	builders = {
		python = function(cmd)
			-- cmd  is just a table string containing the debupy call, e.g. "python -m unittest ${file}"
			local non_modules = { "python", "pipenv", "poetry" }
			local module_index = 1
			if vim.tbl_contains(non_modules, cmd[1]) then
				module_index = 3
			end
			local module = "pytest" -- locking with pytest (for now)

			-- Remaining elements are arguments to the module
			local args = vim.list_slice(cmd, module_index + 1)
			return {
				dap = {
					type = "python",
					request = "launch",
					name = "Debug python test",
					module = module,
					args = args,
				},
			}
		end,
	},
})
