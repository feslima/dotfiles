local M = {}
M.check = function()
	vim.health.start("NvChad custom configs report")
	-- make sure go executable exists
	if vim.fn.executable("go") == 1 then
		vim.health.ok("go is installed")

		-- check for golangci-lint
		if vim.fn.executable("golangci-lint") == 1 then
			vim.health.ok("golangci-lint installed")
		else
			vim.health.ok("golangci-lint not found")
		end
	else
		vim.health.error("golang executable not found!")
	end

	-- make sure github cli executable exists
	if vim.fn.executable("gh") == 1 then
		vim.health.ok("gh CLI is installed")
	else
		vim.health.error("gh CLI executable not found!")
	end

	-- make sure ripgregp executable exists
	if vim.fn.executable("rg") == 1 then
		vim.health.ok("RipGrep is installed")
	else
		vim.health.error("RipGrep executable not found!")
	end

	-- make sure lazygit executable exists
	if vim.fn.executable("lazygit") == 1 then
		vim.health.ok("lazygit is installed")
	else
		vim.health.error("lazygit executable not found!")
	end

	-- make sure lazydocker executable exists
	if vim.fn.executable("lazydocker") == 1 then
		vim.health.ok("lazydocker is installed")
	else
		vim.health.error("lazydocker executable not found!")
	end
end
return M
