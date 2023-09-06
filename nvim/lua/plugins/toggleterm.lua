local M = {}

M.get_opts = {
	size = 15,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
	},
}

M.get_terminal_instance = function()
	return require("toggleterm.terminal").Terminal
end

M.create_floating_term = function(Terminal)
	local term = Terminal:new({
		direction = "float",
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"n",
				"q",
				"<cmd>close<CR>",
				{ noremap = true, silent = true, desc = "Exit terminal" }
			)
		end,
	})

	return term
end

M.create_lazygit_term = function(Terminal)
	local lazygit = Terminal:new({
		cmd = "lazygit",
		direction = "float",
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"n",
				"q",
				"<cmd>close<CR>",
				{ noremap = true, silent = true, desc = "Exit terminal" }
			)
		end,
	})

	return lazygit
end

M.create_lazydocker_term = function(Terminal)
	local lazydocker = Terminal:new({
		cmd = "lazydocker",
		direction = "float",
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(
				term.bufnr,
				"n",
				"q",
				"<cmd>close<CR>",
				{ noremap = true, silent = true, desc = "Exit terminal" }
			)
		end,
	})

	return lazydocker
end

return M
