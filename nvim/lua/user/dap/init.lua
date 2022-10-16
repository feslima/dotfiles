local status_ok, dap = pcall(require, "dap")
if not status_ok then
	vim.notify("Couldn't load 'DAP' plugin!")
	return
end

-- configure breakpoints icons
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#ff0000" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, link = "DiagnosticHint" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#fff200" })

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })

-- load the adapters
dap.adapters = require("user.dap.adapters")

-- load the configurations
dap.configurations = require("user.dap.configurations")

-- enable close hover on q (https://github.com/mfussenegger/nvim-dap/issues/415#issuecomment-1017180055)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dap-float",
	command = "nnoremap <buffer><silent> q <cmd>close!<CR>",
})

-- Set DAP specific keymaps
vim.api.nvim_set_keymap("n", "<F5>", "", {
	noremap = true,
	silent = true,
	desc = "Continue (debugger)",
	callback = function()
		dap.continue()
	end,
})

vim.api.nvim_set_keymap("n", "<F10>", "", {
	noremap = true,
	silent = true,
	desc = "Step over  (debugger)",
	callback = function()
		dap.step_over()
	end,
})

vim.api.nvim_set_keymap("n", "<F11>", "", {
	noremap = true,
	silent = true,
	desc = "Step into  (debugger)",
	callback = function()
		dap.step_into()
	end,
})

vim.api.nvim_set_keymap("n", "<F12>", "", {
	noremap = true,
	silent = true,
	desc = "Step out  (debugger)",
	callback = function()
		dap.step_out()
	end,
})

vim.api.nvim_set_keymap("n", "<F9>", "", {
	noremap = true,
	silent = true,
	desc = "Toggle breakpoint",
	callback = function()
		dap.toggle_breakpoint()
	end,
})

vim.api.nvim_set_keymap("n", "<F8>", "", {
	noremap = true,
	silent = true,
	desc = "Create conditional breakpoint",
	callback = function()
		vim.ui.input({ prompt = "Breakpoint condition:", default = "" }, function(input)
			dap.set_breakpoint(input)
		end)
	end,
})

vim.api.nvim_set_keymap("n", "<F7>", "", {
	noremap = true,
	silent = true,
	desc = "Create log breakpoint",
	callback = function()
		dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end,
})

require("user.dap.ui")
require("user.dap.dap-python")
