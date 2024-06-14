local close_all_floating_windows = function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end

local opts = {
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	pre_save_cmds = {
		close_all_floating_windows,
		function()
			vim.cmd("NotifyCloseAll")
		end,
	},
}

return opts
