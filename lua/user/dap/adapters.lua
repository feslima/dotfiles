local M = {
	python = {
		type = "executable",
		command = vim.g.python3_host_prog,
		args = { "-m", "debugpy.adapter" },
	},
}

return M
