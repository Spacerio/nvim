vim.g.neovide_fullscreen = true
vim.g.neovide_scale_factor = 0.8
vim.g.neovde_hide_cursor_while_typing = true
-- neovide_profiler to enable frametime display

local opts = { noremap = true, silent = true }
local map = vim.keymap.set
-- change scale
map("n", "<C-=>", "<cmd>let g:neovide_scale_factor=g:neovide_scale_factor+0.1<cr>", opts)
map("n", "<C-->", "<cmd>let g:neovide_scale_factor=g:neovide_scale_factor-0.1<cr>", opts)
-- copy and paste
map('v', '<C-C>', '"+y') -- Copy
map('n', '<C-S-V>', '"+p') -- Paste normal mode
map('i', '<C-S-V>', '<c-r>+') -- Paste insert mode
