local status_ok, neotest = pcall(require, "neotest")
local status_ok_plenary, neotest_plenary = pcall(require, "neotest-plenary")
local status_ok_python, neotest_python = pcall(require, "neotest-python")
local status_ok_go, neotest_go = pcall(require, "neotest-go")
local status_ok_vim_test, neotest_vim_test = pcall(require, "neotest-vim-test")
local status_ok_deno, neotest_deno = pcall(require, "neotest-deno")
local status_ok_vitest, neotest_vitest = pcall(require, "neotest-vitest")

if not status_ok then
	vim.notify("Couldn't load 'neotest' plugin!", "error")
	return
end

if not status_ok_plenary then
	vim.notify("Couldn't load 'neotest-plenary' adapter plugin!", "error")
	return
end

if not status_ok_python then
	vim.notify("Couldn't load 'neotest-python' adapter plugin!", "error")
	return
end

if not status_ok_go then
	vim.notify("Couldn't load 'neotest-go' adapter plugin!", "error")
	return
end

if not status_ok_vim_test then
	vim.notify("Couldn't load 'neotest-vim-test' adapter plugin!", "error")
	return
end

if not status_ok_deno then
	vim.notify("Couldn't load 'neotest-deno' adapter plugin!", "error")
	return
end

if not status_ok_vitest then
	vim.notify("Couldn't load 'neotest-vitest' adapter plugin!", "error")
	return
end

_G.test_env = {}

local neotest_python_dap_configs = { justMyCode = false }

function _G.set_test_environment_from_file(fpath)
	local abs = _G.check_env_file_is_valid(fpath)

	local collected_envs = _G.extract_variables_from_file(abs)
	_G.test_env = collected_envs
	if next(_G.test_env) ~= nil then
		neotest_python_dap_configs["env"] = _G.test_env
	end
	vim.notify(vim.inspect(collected_envs), "info", { title = "Successfuly loaded env vars from " .. abs })
end

neotest.setup({
	adapters = {
		neotest_python({
			dap = neotest_python_dap_configs,
			runner = "pytest",
			is_test_file = function(file_path)
				return _G.check_if_file_extension_matches(file_path, ".py")
			end,
		}),
		neotest_plenary,
		neotest_vim_test({
			ignore_file_types = { "python", "vim", "lua", "go" },
		}),
		neotest_go,
		neotest_deno,
		neotest_vitest,
	},
	icons = {
		passed = "",
		failed = "",
		running = "",
		unknown = "",
	},
})
