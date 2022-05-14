local g = vim.g
g.ultest_icons = 1
g.ultest_pass_sign = ""
g.ultest_fail_sign = ""
g.ultest_running_sign = ""
g.ultest_not_run_sign = ""

function _G.set_test_environment_from_file(fpath)
	local abs = _G.check_env_file_is_valid(fpath)

	local collected_envs = _G._extract_variables_from_file(abs)
	g.ultest_env = collected_envs
	vim.notify(vim.inspect(collected_envs), "info", { title = "Successfuly loaded env vars from " .. abs })
end

-- this discovers all files as valid test files
g["test#python#pytest#file_pattern"] = [[\v.+\.py$]]

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
			local module = cmd[module_index]

			-- Remaining elements are arguments to the module
			local args = vim.list_slice(cmd, module_index + 1)

			local config = {
				type = "python",
				request = "launch",
				name = "Debug python test",
				module = module,
				args = args,
			}
			if g.ultest_env ~= vim.NIL then
				config["env"] = g.ultest_env
			end
			return {
				dap = config,
			}
		end,
	},
})
