local opts = {noremap = true, silent = true}
local remap = {silent = true}
local map = vim.api.nvim_set_keymap

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--plugin specific
map('n', '<leader>l', ':Lazy<cr>', opts)
map('n', '<leader>m', ':Mason<cr>', opts)
map('n', '<leader>h', ':<cr>', opts)
map('n', '<leader>e', ':Neotree toggle<cr>', opts)
map('n', '<leader>gg', ':LazyGit<cr>', opts)

--Buffer navigation
map('n', 'L', ':bn<cr>', opts)
map('n', 'H', ':bp<cr>', opts)
map('n', '<M-l>', '<C-^>', opts)

--Split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)

--harpoon
map('n', '<M-j><M-i>', ':lua require("harpoon.mark").add_file()<cr>', opts)
map('n', '<M-u>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)

map('n', '<M-j><M-a>', ':lua require("harpoon.ui").nav_file(1)<cr>', opts)
map('n', '<M-j><M-s>', ':lua require("harpoon.ui").nav_file(2)<cr>', opts)
map('n', '<M-j><M-d>', ':lua require("harpoon.ui").nav_file(3)<cr>', opts)
map('n', '<M-j><M-f>', ':lua require("harpoon.ui").nav_file(4)<cr>', opts)
map('n', '<M-j><M-j>', ':lua require("harpoon.ui").nav_file(5)<cr>', opts)
map('n', '<M-j><M-k>', ':lua require("harpoon.ui").nav_file(6)<cr>', opts)
map('n', '<M-j><M-l>', ':lua require("harpoon.ui").nav_file(7)<cr>', opts)
map('n', '<M-j><M-n>', ':lua require("harpoon.ui").nav_next()<cr>', opts)
map('n', '<M-j><M-p>', ':lua require("harpoon.ui").nav_prev()<cr>', opts)
map('n', '<M-j><M-q>', ':lua require("harpoon.tmux").gotoTerminal(1)<cr>', opts)
map('n', '<M-j><M-w>', ':lua require("harpoon.tmux").gotoTerminal(2)<cr>', opts)
map('n', '<M-j><M-e>', ':lua require("harpoon.tmux").gotoTerminal(3)<cr>', opts)
map('n', '<M-j><M-r>', ':lua require("harpoon.tmux").gotoTerminal(4)<cr>', opts)
map('n', '<M-j><M-t>', ':lua require("harpoon.tmux").gotoTerminal(5)<cr>', opts)
map('n', '<M-j><M-y>', ':lua require("harpoon.tmux").gotoTerminal(6)<cr>', opts)


--Better C-u and C-d
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

--Quit neovim, only userful really with sessions
map('', '<leader>q', '<cmd>qa!<cr>', opts)

--Format on keymap 
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)

--Telescope
themes = require('telescope.themes')
builtin = require('telescope.builtin')
compact_dropdown = themes.get_dropdown{previewer = false, hidden = true}
extensions = require('telescope').extensions

map('n', '<C-p>', ":lua builtin.git_files(compact_dropdown)<cr>", opts)
map('n', '<M-p>', ":lua builtin.fd(compact_dropdown)<cr>", opts)
map('n', '<C-n>', ":Telescope builtin<cr>", opts)
map('n', '<C-g>', ":lua builtin.live_grep(themes.get_ivy())<cr>", opts)
map('n', '<C-f>', ":lua extensions.frecency.frecency(compact_dropdown)<cr>", opts)

----Lsp
--map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', remap)
--map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', remap)
--map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', remap)
--map('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', remap)
--map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', remap)
--map('n', 'gr', '<cmd>lua builtin.lsp_references()<cr>', remap)
----map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', remap)
--map('n', 'gh', '<cmd>lua vim.lsp.buf.rename()<cr>', remap)
--map('n', '<gs>', '<cmd>lua vim.lsp.buf.code_action()<cr>', remap)
--map('x', '<gs>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', remap)
---- Diagnostics
--map('n', 'gl', '<cmd>TroubleToggle<cr>', remap)
--map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', remap) 
--map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', remap)

--Unbind visual K
map('v', 'K', '', opts)

--Terminal window, visual glitches
map('n', '<leader>t', ':vs<cr>:terminal<cr>i', opts)
