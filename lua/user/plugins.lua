local plugins = {
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy"
	},
	{
		'catppuccin/nvim',
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require('user.color')
			color("catppuccin", true)
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		event = 'VeryLazy',
		config = function()
			require('user.plugins.treesitter')
		end,
		dependencies = {
			{
				"nvim-orgmode/orgmode",
			}
		}
	},
	{ 'nvim-lua/plenary.nvim' },
	{
		'nvim-telescope/telescope.nvim',
		event = "VeryLazy",
		cmd = "Telescope", 
		config = function()
			require('user.plugins.telescope')
		end,
		dependencies = {
			'jvgrootveld/telescope-zoxide',
			'nvim-telescope/telescope-file-browser.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			'willthbill/opener.nvim',
			{
				"AckslD/nvim-neoclip.lua",
				name = "neoclip",
				opts = { keys = { telescope = { i = { paste = '<c-j>' } } } }
			},
		},
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
		opts = {
			action_keys = {
				close = { 'gl', 'q' }
			}
		}
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = { map_c_h = true, map_c_w = true }
	},
	{ 'lewis6991/gitsigns.nvim',
		event = "VeryLazy",
		config = function()
			require('user.plugins.gitsigns')
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		config = function()
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
			},
		}
	},
	{
		'theprimeagen/harpoon',
		event = "VeryLazy",
	},
	{
		'ray-x/lsp_signature.nvim',
		event = 'InsertEnter',
		config = true,
	},
	{
		'kdheepak/lazygit.nvim',
		cmd = { "LazyGit", "LazyGitConfig" },
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		event = "VeryLazy",
		config = function()
			require("user.lsp.null-ls")
		end,
		enabled = false,
	},
	{
		'lukas-reineke/lsp-format.nvim',
		config = true,
	},
	{
		'christoomey/vim-tmux-navigator',
		lazy = false,
	},
	{
		'natecraddock/sessions.nvim',
		lazy = false,
		config = function()
			require("user.plugins.sessions")
		end,
	},
	{
		'skywind3000/asyncrun.vim',
		cmd = "AsyncRun",
	},
	-- {
	-- 	'mfussenegger/nvim-dap',
	-- 	-- event = "VeryLazy",
	-- 	cmd = "Dap",
	-- 	setup = true,
	-- 	dependencies = {
	-- 		{
	-- 			'rcarriga/nvim-dap-ui',
	-- 			config = true,
	-- 		},
	-- 		{
	-- 			'jay-babu/mason-nvim-dap.nvim'
	-- 		},
	-- 	},
	-- },
	{
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		config = true,
	},
	{
		'kylechui/nvim-surround',
		event = 'VeryLazy',
		config = true,
	},
	{
		'theprimeagen/vim-be-good',
		cmd = "VimBeGood",
	},
	{
		'nicwest/vim-workman',
		cmd = { 'Workman' }
	},
	{
		'junegunn/fzf.vim',
		event = "VeryLazy",
		dependencies = { 'junegunn/fzf' }
	},
	{
		'dstein64/vim-startuptime',
		cmd = "StartupTime"
	},
	{
		'ggandor/leap.nvim',
		event = "VeryLazy",
	},
	{
		'akinsho/toggleterm.nvim',
		config = true,
		cmd = "ToggleTerm"
	},
	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	event = { "VeryLazy" },
	-- 	opts = { dir = "~/notes" },
	-- },
	{
		'renerocksai/telekasten.nvim',
		cmd = 'Telekasten',
		config = function ()
			require("telekasten").setup({
				home = "/mnt/c/Users/gr289336/Documents/Notes/"
			})
		end
	},
	{ 'milisims/nvim-luaref', event = "VeryLazy" },
	{
		"folke/zen-mode.nvim",
		cmd = 'ZenMode',
		opts = {
			window = { width = 1 },
			plugins = { tmux = { enabled = true }}
		}
	},
	{
		"xeluxee/competitest.nvim",
		dependencies = "muniftanjim/nui.nvim",
		cmd = "CompetiTest",
		keys = "<leader>c",
		opts = {
			testcases_use_single_file = true,
			received_contests_directory = "$(HOME)/projects/$(JUDGE)/$(CONTEST)",
			received_problems_path = "$(HOME)/projects/$(JUDGE)/$(PROBLEM)/main.$(FEXT)",
			evaluate_template_modifiers = true,
			template_file = "~/projects/CSES/template.cpp"
		},
	},
	{
		"stevearc/oil.nvim",
		lazy = false,
		config = function()
			require("oil").setup({
				default_file_explorer = true,
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	}
}

local lsp = {
	{ 'neovim/nvim-lspconfig',
		lazy = false,
		config = function()
			require('user.lsp.handlers')
		end,
		dependencies = {
			{ 'williamboman/mason.nvim', },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'simrat39/rust-tools.nvim' },
			{ 'folke/neodev.nvim' },
		}
	},
	{ 'hrsh7th/nvim-cmp',
		event = {"InsertEnter", "CmdlineEnter", "VeryLazy"},
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
			{ 'kadobot/cmp-plugins', opts = { files = { "plugins.lua" } } },
			{ 'chrisgrieser/cmp-nerdfont' },
			{ 'L3MON4D3/LuaSnip', version = "ea7d7ea510c641c4f15042becd27f35b3e5b3c2b" },
			{ 'rafamadriz/friendly-snippets' },
			{ 'folke/neodev.nvim' },
		}
	},
}

for i = 1, #lsp do
	plugins[#plugins + 1] = lsp[i]
end

return plugins
