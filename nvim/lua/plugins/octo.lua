local M = {}

M.select_actions = function()
	local options_table = {
		"Create PR",
		"Checkout PR",
		"Search PRs",
		"List Opened PRs",
		"Open current PR in the browser",
		"Start a new review",
		"Deletes a pending review for current PR if any",
		"Edit a pending review for current PR",
		"View pending review comments",
		"Close the review window and return to the PR",
		"Submit the review",
		"Assign a PR reviewer",
		"Show PR diff",
		"Copy PR URL to clipboard",
	}
	vim.ui.select(options_table, { prompt = "Select a GitHub action" }, function(choice)
		if choice == options_table[1] then
			vim.cmd("Octo pr create")
		elseif choice == options_table[2] then
			vim.cmd("Octo pr checkout")
		elseif choice == options_table[3] then
			vim.cmd("Octo pr search")
		elseif choice == options_table[4] then
			vim.cmd("Octo pr list")
		elseif choice == options_table[5] then
			vim.cmd("Octo pr browser")
		elseif choice == options_table[6] then
			vim.cmd("Octo review start")
		elseif choice == options_table[7] then
			vim.cmd("Octo review discard")
		elseif choice == options_table[8] then
			vim.cmd("Octo review resume")
		elseif choice == options_table[9] then
			vim.cmd("Octo review comments")
		elseif choice == options_table[10] then
			vim.cmd("Octo review close")
		elseif choice == options_table[11] then
			vim.cmd("Octo review submit")
		elseif choice == options_table[12] then
			vim.ui.input({ prompt = "Type reviewer handle (@):", default = "" }, function(input)
				if input ~= "" then
					vim.cmd("Octo reviewer add " .. input)
				end
			end)
		elseif choice == options_table[13] then
			vim.cmd("Octo pr diff")
		elseif choice == options_table[14] then
			vim.cmd("Octo pr url")
		end
	end)
end

return M
