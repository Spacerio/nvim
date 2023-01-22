local plugins = {
	{
		"folke/tokyonight.nvim",
	},
	{
		'catppuccin/nvim',
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require('user.color')
			color("catppuccin")
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		event = 'VeryLazy',
		config = function()
			require('user.plugins.treesitter')
		end
	},
	{ 'nvim-lua/plenary.nvim' },
	{
		'nvim-telescope/telescope.nvim',
		event = "VeryLazy",
		config = function ()
			require('user.plugins.telescope')
		end,
		dependencies = {
			{
			'nvim-telescope/telescope-frecency.nvim',
			dependencies = { "kkharji/sqlite.lua" }
			}
		}
	},
	{ 'nvim-tree/nvim-web-devicons' },
	{ 'muniftanjim/nui.nvim' },
	{
		'nvim-neo-tree/neo-tree.nvim',
		cmd = "Neotree"
	},
	{
		'folke/trouble.nvim',
		cmd = "TroubleToggle",
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = { map_c_h = true, map_c_w = true }
	},
	{ 'lewis6991/gitsigns.nvim',
		event = "BufWinEnter",
		config = function()
			require('user.plugins.gitsigns')
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		config = function ()
			require('user.plugins.lualine')
		end
	},
	{
		'folke/noice.nvim',
		enabled = false,
		event = "VeryLazy",
		config = function()
			require('user.plugins.noice')
		end,
		dependencies = {
			{
				'rcarriga/nvim-notify',
				config = { background_colour = '#000000' }
			},
		}
	},
	{
		'theprimeagen/harpoon',
		event = "VeryLazy",
		--config = require("user.plugins.harpoon")
	},
	{
		'ray-x/lsp_signature.nvim',
		event = 'InsertEnter',
		config = true,
	},

	--LSP
	{ 'neovim/nvim-lspconfig',
		event = 'VeryLazy',
		config = function()
			require('user.lsp')
		end,
		dependencies = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
		}
	},
	{ 'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		config = function()
			require('user.lsp.cmp')
		end,
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'kadobot/cmp-plugins', config = true },
			{ 'chrisgrieser/cmp-nerdfont' },
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	},
}

return plugins


--NOTE: plugin defined keymaps don't work for now, don't know why.
