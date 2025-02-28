return {
	{
		'numToStr/Comment.nvim',
		enabled = false, -- upstreamed to core
		event = 'VeryLazy',
		config = true,
	},
	{
		'kylechui/nvim-surround',
		event = 'VeryLazy',
		config = true,
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			{ 'muniftanjim/nui.nvim' },
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>e", "<cmd>Neotree<cr>", silent = true, noremap = true}
		}
	},
	{
		'theprimeagen/vim-be-good',
		cmd = "VimBeGood",
	},
	{
		'nicwest/vim-workman',
		cmd = 'Workman'
	},
	{
		'dstein64/vim-startuptime',
		cmd = "StartupTime"
	},
	{
		'akinsho/toggleterm.nvim',
		config = true,
		cmd = "ToggleTerm"
	},
	{
		'christoomey/vim-tmux-navigator',
		event = "VeryLazy"
	},
	{
		'j-hui/fidget.nvim',
		event = "VeryLazy",
		opts = {}
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		event = { "WinLeave" },
		opts = {
			smooth = false,
		}
	},
	-- { -- this breaks telescope through plenary somehow?
	--    "m4xshen/hardtime.nvim",
	-- 	event = "VeryLazy",
	--    -- dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	--    opts = {}
	-- },
}
