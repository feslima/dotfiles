local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	vim.notify("Couldn't load 'dapui' for 'dap' plugin!")
	return
end

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	vim.notify("Couldn't load 'DAP' for 'dapui'!")
	return
end

dap.listeners.after["event_initialized"]["me"] = function()
	dapui.open() -- automatically opens the ui when session starts
end

dap.listeners.after["event_terminated"]["me"] = function()
	dapui.close() -- automatically closes the ui when session starts
end

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{ -- You can change the order of elements in the sidebar
			elements = {
				-- Provide as ID strings or tables with "id" and "size" keys
				{
					id = "scopes",
					size = 0.25, -- Can be float or integer > 1
				},
				{ id = "breakpoints", size = 0.25 },
				{ id = "stacks", size = 0.25 },
				{ id = "watches", size = 0.25 },
			},
			size = 40,
			position = "right", -- Can be "left", "right", "top", "bottom"
		},
		{
			elements = { "repl" },
			size = 15,
			position = "bottom", -- Can be "left", "right", "top", "bottom"
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})

function debugger_toggle(args)
	dapui.toggle()
end

function debugger_open(args)
	dapui.open()
end

function debugger_close(args)
	dapui.close()
end

function debugger_eval(args)
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
vim.api.nvim_create_user_command("DebuggerEval", debugger_eval, { desc = "Evaluate one time expression in debugger" })
