local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	vim.notify("Couldn't load 'bufferline' plugin!", "error")
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		numbers = "none",
		close_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		right_mouse_command = "Bdelete! %d",
		middle_mouse_command = nil,
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 25,
		tab_size = 21,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
	},
	highlights = {
		fill = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "StatusLineNC" },
		},
		background = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "StatusLine" },
		},
		buffer_visible = {
			gui = "italic",
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		buffer_selected = {
			gui = "bold",
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		separator = {
			guifg = { attribute = "bg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "StatusLine" },
		},
		separator_selected = {
			guifg = { attribute = "fg", highlight = "Special" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		separator_visible = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "StatusLineNC" },
		},
		close_button = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "StatusLine" },
		},
		close_button_selected = {
			guifg = { attribute = "fg", highlight = "normal" },
			guibg = { attribute = "bg", highlight = "normal" },
		},
		close_button_visible = {
			guifg = { attribute = "fg", highlight = "normal" },
			guibg = { attribute = "bg", highlight = "normal" },
		},
		modified = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},
		modified_selected = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		modified_visible = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},
		indicator_selected = {
			guifg = { attribute = "fg", highlight = "Directory" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		duplicate_selected = {
			guifg = { attribute = "fg", highlight = "BufferVisible" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		duplicate = {
			guifg = { attribute = "fg", highlight = "BufferVisible" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
	},
})
