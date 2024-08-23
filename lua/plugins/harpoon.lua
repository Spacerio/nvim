return {
	'theprimeagen/harpoon',
	event = "VeryLazy",
	keys = function()
		local opts = {noremap = true, silent = true}
		vim.keymap.set('n', '<M-j>i', ':lua require("harpoon.mark").add_file()<cr>', opts)
		vim.keymap.set('n', '<M-u>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
		vim.keymap.set('n', '<M-y>', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<cr>', opts)
		vim.keymap.set('n', '<M-j><M-a>', ':lua require("harpoon.ui").nav_file(1)<cr>', opts)
		vim.keymap.set('n', '<M-j><M-s>', ':lua require("harpoon.ui").nav_file(2)<cr>', opts)
		vim.keymap.set('n', '<M-j><M-d>', ':lua require("harpoon.ui").nav_file(3)<cr>', opts)
		vim.keymap.set('n', '<M-j><M-f>', ':lua require("harpoon.ui").nav_file(4)<cr>', opts)
		vim.keymap.set('n', '<M-j><M-j>', ':lua require("harpoon.ui").nav_file(5)<cr>', opts)
		vim.keymap.set('n', '<M-j><M-k>', ':lua require("harpoon.ui").nav_file(6)<cr>', opts)
		vim.keymap.set('n', '<M-j><M-l>', ':lua require("harpoon.ui").nav_file(7)<cr>', opts)
		vim.keymap.set('n', "<M-o>", function()
			require("harpoon.ui").nav_file(vim.v.count)
		end, opts)
	end
}
