local config = function()
	require("telescope").setup {
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown()
			},
		},
	}

	-- require("telescope").load_extension("harpoon")
	-- require("telescope").load_extension("lazygit")
	-- require("telescope").load_extension("ui-select")
	-- require("telescope").load_extension("file_browser")
	-- require("telescope").load_extension("zoxide")
	-- require("telescope").load_extension("opener")
	-- require("telescope").load_extension("neoclip")
	require("telescope").load_extension("helpgrep")

end
local opts = {noremap = true, silent = true}

return {
	'nvim-telescope/telescope.nvim',
	-- event = "VeryLazy",
	cmd = "Telescope", 
	dependencies = {
		'nvim-lua/plenary.nvim',
		'jvgrootveld/telescope-zoxide',
		'nvim-telescope/telescope-file-browser.nvim',
		'nvim-telescope/telescope-ui-select.nvim',
		'nvim-telescope/telescope-symbols.nvim',
		'willthbill/opener.nvim',
		'catgoose/telescope-helpgrep.nvim',
		{
			"AckslD/nvim-neoclip.lua",
			name = "neoclip",
			opts = { keys = { telescope = { i = { paste = '<c-j>' } } } }
		},
		{
			"folke/todo-comments.nvim",
			opts = { }
		},
	},
	config = config,

	keys = {
		vim.keymap.set("n", "<C-p>", require("util.find").project_files, opts),
		vim.keymap.set('n', '<leader>fg', require("util.find").grep, opts),
		vim.keymap.set('n', '<leader>fo', '<cmd>Telescope opener hidden=false respect_gitignore=true root_dir="~/Documents"<cr>', opts),
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope fd<cr>", {noremap = true, silent = true}),
		vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts),
		vim.keymap.set('n', '<leader>fB', "<cmd>Telescope builtin<cr>", opts),
		vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts),
		vim.keymap.set('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', opts),
		vim.keymap.set('n', '<leader>fs', '<cmd>Telescope treesitter<cr>', opts),
		vim.keymap.set('n', '<leader>fO', '<cmd>Telescope vim_options<cr>', opts),
		vim.keymap.set('n', '<leader>ft', '<cmd>Telescope filetypes<cr>', opts),
		vim.keymap.set('n', '<leader>fc', '<cmd>Telescope command_history<cr>', opts),
		vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts),
		vim.keymap.set('n', '<leader>fH', require("util.find").hgrep, opts),
		vim.keymap.set('n', '<leader>fp', '<cmd>Telescope man_pages<cr>', opts),
		vim.keymap.set('n', '<leader>fA', '<cmd>Telescope autocommands<cr>', opts),
		vim.keymap.set('n', '<leader>fm', '<cmd>Telescope marks<cr>', opts),
		vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', opts),
		vim.keymap.set('n', '<leader>fe', '<cmd>Telescope registers<cr>', opts),
		vim.keymap.set('n', '<leader>fl', '<cmd>Telescope neoclip<cr>', opts),
		vim.keymap.set('n', '<leader>fS', '<cmd>Telescope symbols<cr>', opts),
		vim.keymap.set('n', '<leader>z', '<cmd>lua require("telescope").extensions.zoxide.list({})<cr>', opts),
		vim.keymap.set('n', '<leader>b', '<cmd>Telescope file_browser hidden=true<cr>', opts),
		vim.keymap.set('n', '<leader>p', '<cmd>Telescope projects<cr>', opts),
	}
}
