local M = {}

M.configure_hls_and_signs = function()
	vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#ff0000" })
	vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, link = "DiagnosticHint" })
	vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#fff200" })

	vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })
end

M.setup_dap_events = function(dap, dapui)
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

M.setup_autocmds = function(dapui)
	local debugger_toggle = function()
		dapui.toggle()
	end

	local debugger_open = function()
		dapui.open()
	end

	local debugger_close = function()
		dapui.close()
	end

	local debugger_eval = function()
		vim.ui.input({ prompt = "Type expression for one time evaluation" }, function(input)
			if input ~= "" and input ~= nil then
				dapui.eval(input)
				dapui.eval() -- this jumps the cursor to the floating window
			end
		end)
	end

	vim.api.nvim_create_user_command("DebuggerToggle", debugger_toggle, { desc = "Toggle debugger UI" })
	vim.api.nvim_create_user_command("DebuggerOpen", debugger_open, { desc = "Open debugger UI" })
	vim.api.nvim_create_user_command("DebuggerClose", debugger_close, { desc = "Close debugger UI" })
	vim.api.nvim_create_user_command(
		"DebuggerEval",
		debugger_eval,
		{ desc = "Evaluate one time expression in debugger" }
	)
end

--@type dapui.Config
M.default_opts_table = {
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = "",
		},
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = "",
	},
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.25,
				},
				{
					id = "breakpoints",
					size = 0.25,
				},
				{
					id = "stacks",
					size = 0.25,
				},
				{
					id = "watches",
					size = 0.25,
				},
			},
			position = "right",
			size = 40,
		},
		{
			elements = {
				{
					id = "repl",
					size = 0.5,
				},
				{
					id = "console",
					size = 0.5,
				},
			},
			position = "bottom",
			size = 10,
		},
	},
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t",
	},
	render = {
		indent = 1,
		max_value_lines = 100,
	},
}

return M
