return {
	'cbochs/grapple.nvim',
	cmd = "Grapple",
	keys = {
		{ "<M-u>", function() require("grapple").toggle_tags() end, desc = "open grapple menu"},
		{ "<leader>a", function() require("grapple").toggle() end, desc = "toggle grapple tag"},
		{ "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple index 1"},
		{ "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple index 2"},
		{ "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple index 3"},
		{ "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple index 4"},
		{ "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Grapple index 5"},
		{ "<leader>6", "<cmd>Grapple select index=6<cr>", desc = "Grapple index 6"},
		{ "<leader>7", "<cmd>Grapple select index=7<cr>", desc = "Grapple index 7"},
		{ "<leader>8", "<cmd>Grapple select index=8<cr>", desc = "Grapple index 8"},
		{ "<leader>9", "<cmd>Grapple select index=9<cr>", desc = "Grapple index 9"},
	}
}
