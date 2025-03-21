return {
	'theprimeagen/harpoon',
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
	keys = {
		{ "<leader>a", function() require("harpoon"):list():add() end, desc = ""},
		{ "<M-u>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = ""},
		{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon buffer 1"},
		{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon buffer 2"},
		{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon buffer 3"},
		{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon buffer 4"},
		{ "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon buffer 5"},
		{ "<leader>6", function() require("harpoon"):list():select(6) end, desc = "harpoon buffer 6"},
		{ "<leader>7", function() require("harpoon"):list():select(7) end, desc = "harpoon buffer 7"},
		{ "<leader>8", function() require("harpoon"):list():select(8) end, desc = "harpoon buffer 8"},
		{ "<leader>9", function() require("harpoon"):list():select(9) end, desc = "harpoon buffer 9"},
	}
}
