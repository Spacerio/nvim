return {
	"kdheepak/lazygit.nvim",
	enabled = false,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	config = function()
		require("telescope").load_extension("lazygit")
	end,
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
	}
}
