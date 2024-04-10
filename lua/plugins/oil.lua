return {
	"stevearc/oil.nvim",
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
