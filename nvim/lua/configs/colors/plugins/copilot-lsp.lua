---@param c ColorsTable
---@return table
local set_colors = function(c)
	return {
		CopilotLspNesAdd = { link = "DiffAdd" },
		CopilotLspNesDelete = { link = "DiffDelete" },
		CopilotLspNesApply = { link = "DiffText" },
	}
end

return set_colors
