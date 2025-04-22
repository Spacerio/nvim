vim.g.neovde_hide_cursor_while_typing = true
vim.g.neovide_scale_factor = 1

local opts = { noremap = true, silent = true }
local map = vim.keymap.set
-- change scale
map("n", "<C-=>", "<cmd>let g:neovide_scale_factor=g:neovide_scale_factor+0.1<cr>", opts)
map("n", "<C-->", "<cmd>let g:neovide_scale_factor=g:neovide_scale_factor-0.1<cr>", opts)
-- copy and paste
map('v', '<C-C>', '"+y') -- Copy
map('n', '<C-S-V>', '"+p') -- Paste normal mode
map('i', '<C-S-V>', '<c-r>+') -- Paste insert mode

-- Windows specific configuration
if vim.g.os ~= 'Linux' then
	vim.g.neovide_fullscreen = true
	vim.g.neovide_scale_factor = 0.8
	-- Open neovide on windows at desktop, always
	local os = require("os")
	local path_to_desktop = os.getenv("USERPROFILE") .. "\\Desktop"
	local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })
	vim.api.nvim_create_autocmd(
		{"VimEnter"},
		{ pattern = "*", command = "cd " .. path_to_desktop, group = vim_enter_group }
	)
end
