local cmp = require('cmp')
local luasnip = require('luasnip')

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
	Copilot = ""
}

local border = {
	{ "╭", "CmpBorder" },
	{ "─", "CmpBorder" },
	{ "╮", "CmpBorder" },
	{ "│", "CmpBorder" },
	{ "╯", "CmpBorder" },
	{ "─", "CmpBorder" },
	{ "╰", "CmpBorder" },
	{ "│", "CmpBorder" },
}
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', priority = 1000 },
		{ name = 'nvim_lua' },
		{ name = 'buffer', keyword_lenght = 4 },
		{ name = 'path' },
		{ name = 'luasnip' },
		{ name = 'plugins' },
		{ name = 'nerdfont' },
		{ name = 'orgmode' },
		{ name = 'neodev' },
	}, { { name = 'buffer' } }),
	view = {
		entries = "custom"
	},
	window = {
		-- completion = {
		-- 	scrollbar = true,
		-- 	border = border,
		-- 	winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		-- },
		documentation = {
			border = border,
		},
	},
	performance = {
		debounce = 1,
		throttle = 1,

	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping {
			i = cmp.mapping.select_prev_item(),
			c = cmp.config.disable,
		},
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs( -1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<CR>"] = cmp.mapping.confirm { select = false },
		["<C-l>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		["<Tab>"] = cmp.mapping(function(fallback)
			if not has_words_before() then
				fallback()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif cmp.visible() then
				cmp.confirm { select = true }
			elseif luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function()
			luasnip.jump( -1)
		end
		),
	}),
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- vim_item.kind = string.format("%s", icons[vim_item.kind])
			vim_item.kind = string.format('%s ', icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
					nvim_lsp = "",
					luasnip = " ",
					buffer = "﬘",
					path = "[Path]",
					crates = "",
					copilot = "",
					cmdline = "",
					plugins = "ﮣ",
					nerdfont = "[NF]",
					orgmode = "[ORG]",
				})[entry.source.name]
			return vim_item
		end,
	},
	enabled = function()
		-- if require"cmp.config.context".in_treesitter_capture("comment")==true or require"cmp.config.context".in_syntax_group("Comment") then
		--   return false
		-- else
		--   return true
		-- end
		if vim.bo.ft == "TelescopePrompt" then
			return false
		end
		if vim.bo.ft == "markdown" then
			return false
		end
		local lnum, col =
			vim.fn.line("."), math.min(vim.fn.col("."), #vim.fn.getline("."))
		for _, syn_id in ipairs(vim.fn.synstack(lnum, col)) do
			syn_id = vim.fn.synIDtrans(syn_id) -- Resolve :highlight links
			if vim.fn.synIDattr(syn_id, "name") == "Comment" then
				return false
			end
		end
		-- if vim.tbl_contains(Get_treesitter_hl(), "TSComment") then
		-- 	return false
		-- end
		-- if string.find(vim.api.nvim_buf_get_name(0), "neorg://") then
		-- 	return false
		-- end
		-- if string.find(vim.api.nvim_buf_get_name(0), "s_popup:/") then
		-- 	return false
		-- end
		return true
	end,
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)



require("user.snip")
