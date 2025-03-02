return {
	'saghen/blink.cmp',
	version = '*',
	dependencies = {
		"L3MON4D3/LuaSnip",
		version = 'v2.*',
		dependencies = { "rafamadriz/friendly-snippets" },

	},
	opts = {
		snippets = { preset = "luasnip" },
		sources = {
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
				selection = { auto_insert = false }
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
			['<Tab>'] = {
				function(cmp)
					return cmp.select_and_accept()
				end,
				'snippet_forward',
				'fallback'
			},

		},
		cmdline = {
			enabled = true,
			keymap = {
				['<C-p>'] = { function(cmp) cmp.hide() end, 'fallback' },
				['<C-n>'] = { function(cmp) cmp.hide() end, 'fallback' },
			},
			completion = { menu = { auto_show = function() return vim.fn.getcmdtype() == ':' end} },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = {
		"sources.default"
	}
}
