local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = function()
		return vim.fn.winwidth(0) > 80
	end,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local location = {
	"location",
	padding = 0,
}

local filename = {
	"filename",
	file_status = true, -- displays file status (readonly status, modified status)
	path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
}

local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * 100)
	return index .. "%%"
end

local opts = {
	options = {
		icons_enabled = true,
		theme = require("configs.colors.plugins.lualine"),
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { "mode" },
		lualine_c = { filename },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}

return opts
