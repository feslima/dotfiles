local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function edit_or_open()
		local node = api.tree.get_node_under_cursor()

		if node.nodes ~= nil then
			-- expand or collapse folder
			api.node.open.edit()
		else
			-- open file
			api.node.open.edit()
			-- Close the tree if file was opened
			api.tree.close()
		end
	end

	-- open as vsplit on current node
	local function vsplit_preview()
		local node = api.tree.get_node_under_cursor()

		if node.nodes ~= nil then
			-- expand or collapse folder
			api.node.open.edit()
		else
			-- open file as vsplit
			api.node.open.vertical()
		end

		-- Finally refocus on tree if it was lost
		api.tree.focus()
	end

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
	vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
	vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Go to parent closing node"))
	vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

local nvim_tree_opts = {
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {
			[[\.git$]],
			"__pycache__",
			[[\.pytest_cache$]],
			"venv",
			[[\.venv$]],
		},
	},
	on_attach = on_attach,
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
		},
	},
	view = {
		side = "right",
	},
}

return nvim_tree_opts
