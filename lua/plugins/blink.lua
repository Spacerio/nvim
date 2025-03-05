return {
	'saghen/blink.cmp',
	version = '*',
	dependencies = {
		"L3MON4D3/LuaSnip",
		version = 'v2.*',
		dependencies = { "rafamadriz/friendly-snippets" },

		{
			"saghen/blink.compat",
			opts = {
				  impersonate_nvim_cmp = true,
			},
			version = "*",
		},
	},
	opts = {
		snippets = { preset = "luasnip" },
		sources = {
			-- compat = {},
			default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100, -- show at a higher priority than lsp
				}
			}
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				}
			},
			accept = {
				auto_brackets = {
					enabled = true
				},
			},
			documentation = {
				auto_show = true,

			}
		},
		keymap = {
			preset = "default",
			-- wanted behaviour: do not select initially, tab selects first one
			['<Tab>'] = {
				function(cmp)
					return cmp.select_and_accept()
				end,
				'snippet_forward',
				'fallback'
			},
			['<C-n>'] = { 'show', 'select_next', 'fallback' },
			['<C-p>'] = { 'show', 'select_prev', 'fallback' },

		},
		cmdline = {
			enabled = true,
			-- wanted behaviour: do not select initially, tab cycles through
			keymap = {
				['<C-p>'] = { function(cmp) cmp.hide() end, 'fallback' },
				['<C-n>'] = { function(cmp) cmp.hide() end, 'fallback' },
				['<cr>'] = { 'accept_and_enter', 'fallback' },
			},
			completion = {
				list = {
					selection = {
						preselect = false,
						-- auto_insert = false,
					},
				},
				menu = { auto_show = function() return vim.fn.getcmdtype() == ':' end}
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = {
		"sources.default",
		"sources.compat",
	}
}
