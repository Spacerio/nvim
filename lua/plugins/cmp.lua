local config = function()
	local cmp = require('cmp')
	local luasnip = require('luasnip')

	local icons = {
		Text = "󰊄",
		Method = "m",
		Function = "󰊕",
		Constructor = "",
		Field = " ",
		Variable = "",
		Class = "",
		Interface = "",
		Module = "",
		Property = "",
		Unit = "",
		Value = "",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "",
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

	local has_words_before = function()
		unpack = unpack or table.unpack
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local maps = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
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
		end ),
	}

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp', priority = 100 },
			{ name = 'path' },
			{ name = 'luasnip' },
			{ name = 'plugins' },
			{ name = 'nerdfont' },
			{ name = 'orgmode' },
			{ name = "lazydev", group_index = 0},
			{ name = 'buffer', keyword_lenght = 4, priority = 0 },
		}),
		view = {
			entries = "custom",
		},
		window = {
			-- completion = {
				-- 	scrollbar = true,
				-- 	border = border,
				-- 	winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				--  enabled = true,
				-- },
				documentation = {
					border = border,
				},
			},
			performance = {
				async_budget = 1,
				debounce = 1,
				throttle = 1,
			},
			mapping = cmp.mapping.preset.insert(maps),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				expandable_indicator = true,
				format = function(entry, vim_item)
					vim_item.kind = string.format('%s ', icons[vim_item.kind])
					vim_item.menu = ({
						nvim_lsp = "",
						luasnip = " ",
						buffer = "",
						path = "[Path]",
						crates = "",
						copilot = "",
						cmdline = "",
						plugins = "",
						nerdfont = "[NF]",
						orgmode = "[ORG]",
					})[entry.source.name]
					return vim_item
				end,
			},
			enabled = function ()
				if vim.bo.ft == "TelescopePrompt" then
					return false
				end
				if vim.bo.ft == "markdown" then
					return false
				end
				if vim.bo.ft == "snacks_picker_input" then
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
				return true
			end
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(maps),
			-- completion = { autocomplete = { enabled = true } },
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			})
		})

		require("util.snip")
end

return { 'hrsh7th/nvim-cmp',
	event = "VeryLazy",
	config = config,
	dependencies = {
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'hrsh7th/cmp-cmdline' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'hrsh7th/cmp-nvim-lua' },
		{ 'kadobot/cmp-plugins', opts = { files = { "plugins.lua" } } },
		{ 'chrisgrieser/cmp-nerdfont' },
		{ 'L3MON4D3/LuaSnip', version = "v2.*" },
		{ 'rafamadriz/friendly-snippets' },
		{ 'folke/neodev.nvim' },
		-- {
		-- 	'windwp/nvim-autopairs',
		-- 	opts = { map_c_h = true, map_c_w = true }
		-- }
	}
}
