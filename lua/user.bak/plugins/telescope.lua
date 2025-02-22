require("telescope").setup {
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown()
		},
	},
}

require("telescope").load_extension("harpoon")
require("telescope").load_extension("lazygit")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("zoxide")
require("telescope").load_extension("opener")
require("telescope").load_extension("neoclip")
