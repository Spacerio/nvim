return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		winopts = {

		},
		previewers = {
			head = {
				cmd = "ls",
				args = nil,
			}
		},
	},
	cmd = "FzfLua",
	keys = {
		-- TODO: make this a custom picker instead
		{ "<leader>ff", function() require("fzf-lua").files() end, desc = "fzf files" },
		{ "<leader>fd", require("util.find").directories, desc = "fzf directories" },
	},
}
