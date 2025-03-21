return {
	'theprimeagen/harpoon',
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
	keys = {
		{ "<leader>a", function() require("harpoon"):list():add() end, desc = ""},
		{ "<M-u>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = ""},
		{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = ""},
		{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = ""},
		{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = ""},
		{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = ""},
		{ "<leader>5", function() require("harpoon"):list():select(5) end, desc = ""},
		{ "<leader>6", function() require("harpoon"):list():select(6) end, desc = ""},
	}
	-- keys = function()
	-- 	local opts = {noremap = true, silent = true}
	-- 	vim.keymap.set('n', '<M-j>i', ':lua require("harpoon.mark").add_file()<cr>', opts)
	-- 	vim.keymap.set('n', '<M-u>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
	-- 	vim.keymap.set('n', '<M-y>', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<cr>', opts)
	-- 	vim.keymap.set('n', '<M-j><M-a>', ':lua require("harpoon.ui").nav_file(1)<cr>', opts)
	-- 	vim.keymap.set('n', '<M-j><M-s>', ':lua require("harpoon.ui").nav_file(2)<cr>', opts)
	-- 	vim.keymap.set('n', '<M-j><M-d>', ':lua require("harpoon.ui").nav_file(3)<cr>', opts)
	-- 	vim.keymap.set('n', '<M-j><M-f>', ':lua require("harpoon.ui").nav_file(4)<cr>', opts)
	-- 	vim.keymap.set('n', '<M-j><M-j>', ':lua require("harpoon.ui").nav_file(5)<cr>', opts)
	-- 	vim.keymap.set('n', '<M-j><M-k>', ':lua require("harpoon.ui").nav_file(6)<cr>', opts)
	-- 	vim.keymap.set('n', '<M-j><M-l>', ':lua require("harpoon.ui").nav_file(7)<cr>', opts)
	-- 	vim.keymap.set('n', "<M-o>", function()
	-- 		require("harpoon.ui").nav_file(vim.v.count)
	-- 	end, opts)
	-- end
}
