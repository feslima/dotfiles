-- add binaries installed by mason.nvim to path
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

local autocmd = vim.api.nvim_create_autocmd

-- load base configs
require("configs")

-- reload some options on-save
autocmd("BufWritePost", {
	pattern = vim.tbl_map(function(path)
		return vim.fs.normalize(vim.loop.fs_realpath(path))
	end, vim.fn.glob(vim.fn.stdpath("config") .. "/lua/@(configs|plugins)/**/*.lua", true, true, true)),

	callback = function(opts)
		local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
		local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
		local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

		local reload = require("plenary.reload")
		if string.match(module, "configs.colors") then
			reload.reload_module("configs.colors")
		end

		if string.match(module, "plugins.init") then
			reload.reload_module("plugins")
		end
	end,
})

-- lazy.nvim config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {}

-- load plugins
local plugins = require("plugins")

require("lazy").setup(plugins, lazy_opts)
