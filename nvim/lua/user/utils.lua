local p_status_ok, Path = pcall(require, "plenary.path")
if not p_status_ok then
	vim.notify("Couldn't load 'plenary.path'!", "error")
	return
end

local _get_variable_name = function(line)
	return line:match("^([A-Z0-9_]+)=.*$")
end

local _get_variable_value = function(line)
	return line:match("^[A-Z0-9_]+=(.*)$")
end

function _G.extract_variables_from_file(fpath)
	local collected_envs = {}
	local file_contents = vim.fn.readfile(fpath)
	for _, line in ipairs(file_contents) do
		collected_envs[_get_variable_name(line)] = _get_variable_value(line)
	end
	return collected_envs
end

---@param fpath string
---@param ext string
---@return boolean
function _G.check_if_file_extension_matches(fpath, ext)
	return fpath:match("^.+(%..+)$") == ext
end

function _G.check_env_file_is_valid(fpath)
	local p = Path:new(fpath)
	local abs = p:absolute()
	if not p:exists() then
		vim.notify("Path " .. abs .. " does not exist.", "error")
		return
	end

	if not p:is_file() then
		vim.notify("Path " .. abs .. " is not a file.", "error")
		return
	end

	if not check_if_file_extension_matches(abs, ".env") then
		vim.notify("Path " .. abs .. " is not a .env file.", "error")
		return
	end
	return abs
end
