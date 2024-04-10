return {
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
		'folke/trouble.nvim',
		cmd = "TroubleToggle",
		opts = {
			action_keys = {
				close = { 'gl', 'q' }
			}
		},
		keys = {{ "gl", "<cmd>TroubleToggle<cr>", silent = true, noremap = true}}
	},
}
