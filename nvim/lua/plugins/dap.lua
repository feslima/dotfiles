local M = {}

M.load_dap_python_options = function()
	local VIRTUAL_ENV = os.getenv("VIRTUAL_ENV")

	if VIRTUAL_ENV == nil then
		vim.notify("VIRTUAL_ENV variable not loaded. This means not virtual env is active.", vim.log.levels.ERROR)
		return nil
	end

	local python_exec = VIRTUAL_ENV .. "/bin/python"
	if vim.fn.executable(python_exec) ~= 1 then
		vim.notify("VIRTUAL_ENV variable is loaded but the venv python binary was not found,", vim.log.levels.ERROR)
		return nil
	end

	return { python_path = python_exec }
end

M.load_python_adapters = function(dap, python_exec_path)
	dap.adapters.python = function(cb, config)
		if config.request == "launch" then
			cb({
				type = "executable",
				command = python_exec_path,
				args = { "-m", "debugpy.adapter" },
				options = {
					source_filetype = "python",
				},
			})
		elseif config.request == "attach" then
			cb({
				type = "server",
				port = config.connect.port,
				host = config.connect.host,
				options = {
					source_filetype = "python",
				},
			})
		end
	end
end

M.load_python_configurations = function(dap, python_exec_path)
	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch current file",

			-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
			program = "${file}",
			pythonPath = function()
				if vim.fn.executable(python_exec_path) == 1 then
					return python_exec_path
				else
					return "/usr/bin/python"
				end
			end,
		},
		{
			type = "python",
			request = "attach",
			name = "Remote attach on 11211",
			connect = {
				host = "0.0.0.0",
				port = 11211,
			},
			pathMappings = {
				{
					localRoot = "${workspaceFolder}",
					remoteRoot = "/app",
				},
			},
		},
	}
end

return M
