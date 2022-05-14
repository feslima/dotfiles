local status_ok, rest = pcall(require, "rest-nvim")
if not status_ok then
	vim.notify("Couldn't load 'rest-nvim' plugin!", "error")
	return
end
local configs = {
	-- Open request results in a horizontal split
	result_split_horizontal = false,
	-- Keep the http file buffer above|left when split horizontal|vertical
	result_split_in_place = false,
	-- Skip SSL verification, useful for unknown certificates
	skip_ssl_verification = false,
	-- Highlight request on run
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		-- toggle showing URL, HTTP info, headers at top the of result window
		show_url = true,
		show_http_info = true,
		show_headers = true,
	},
	-- Jump to request line on run
	jump_to_request = false,
	env_file = ".env",
	custom_dynamic_variables = {},
	yank_dry_run = true,
}
rest.setup(configs)

function _G.set_http_env_from_file(fpath)
	local abs = _G.check_env_file_is_valid(fpath)
	configs.env_file = abs
	rest.setup(configs)
end
