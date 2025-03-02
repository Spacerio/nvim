return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		keymaps = {
			["<C-p>"] = false,
			["<M-p>"] = "actions.preview",
		}
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{"-", "<cmd>Oil<cr>", desc = "open Oil" },
		{"<leader>-", function() require("oil").toggle_float() end, desc = "open Oil" }
	},
}
