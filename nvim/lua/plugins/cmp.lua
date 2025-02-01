local cmp = require("cmp")
local luasnip = require("luasnip")

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

local kind_icons = {
	Namespace = "󰌗",
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰆧",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈚",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰊄",
	Table = "",
	Object = "󰅩",
	Tag = "",
	Array = "[]",
	Boolean = "",
	Number = "",
	Null = "󰟢",
	String = "󰉿",
	Calendar = "",
	Watch = "󰥔",
	Package = "",
	Copilot = "",
	Codeium = "",
	TabNine = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local M = {
	snippet = { -- Check nvim-cmp repo README for more configurations.
		expand = function(args)
			luasnip.lsp_expand(args.body) -- Using LuaSnip engine
		end,
	},
	mapping = {
		["<A-k>"] = cmp.mapping.select_prev_item(), -- Press Alt + k to go to previous item in completion popup
		["<A-j>"] = cmp.mapping.select_next_item(), -- Press Alt + j to go to next item in completion popup
		-- Control + (b|f) to scroll docs in completion popup
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		-- Control + space to make completion popup appear
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(), -- closes the popup when in insertion mode
			c = cmp.mapping.close(), -- closes the popup when in completion mode
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- Super Tab, keep pressing TAB to cycle throught completion in different scenarios
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<A-y>"] = require("minuet").make_cmp_map(),
	},
	-- How the completion menu is formatted
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, item)
			local icon = kind_icons[item.kind]
			if icon == nil then
				icon = " " .. kind_icons.Null .. " "
			else
				icon = " " .. icon .. " "
			end

			item.kind = string.format("%s", icon)
			item.menu = ({
				nvim_lsp = "[LSP]",
				nvim_lua = "[NVim Lua]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
				minuet = "[AI Completion]",
				codecompanion = "[AI]",
			})[entry.source.name]
			return item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "codecompanion" },
		{ name = "minuet" },
		{ name = "buffer" },
		{ name = "path" },
	},
	window = {
		completion = {
			border = border("CmpDocBorder"),
			side_padding = 1,
			winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
			scrollbar = false,
		},
		documentation = {
			border = border("CmpDocBorder"),
			winhighlight = "Normal:CmpDoc",
		},
	},
}
return M
