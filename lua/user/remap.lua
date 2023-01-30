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

-- Better indent, stay in visual
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

--Switch ` and '
map('n', '\'', '`', opts)

-- Luasnip select
vim.api.nvim_set_keymap("i", "<M-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<M-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<M-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<M-p>", "<Plug>luasnip-prev-choice", {})

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

-- Dap keymaps
map('n', '<leader>b', ':lua require("dap").toggle_breakpoint()<cr>', opts)
map('n', '<F5>', ':lua require("dap").continue()<cr>', opts)
map('n', '<F10>', ':lua require("dap").step_over()<cr>', opts)
map('n', '<F11>', ':lua require("dap").step_into()<cr>', opts)
map('n', '<F12>', ':lua require("dap").step_out()<cr>', opts)
map('n', '<leader>rp', ':lua require("dap").repl.open()<cr>', opts)
map('n', '<leader>re', ':lua require("dap").terminate()<cr>', opts)
map('n', '<leader>rl', ':lua require("dap").run_last()<cr>', opts)
map('n', '<leader>rn', ':RustRunnables<cr>', opts)
map('n', '<leader>rd', ':RustDebuggables<cr>', opts)

--Better C-u and C-d
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

--Quit neovim, only userful really with sessions
map('n', '<leader>q', '<cmd>SessionsSave<cr><cmd>qa!<cr>', opts)

--Format on keymap
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)

-- Delete other buffers
map('n', '<leader>d', ':mark t | w | %bd | e# | bd# <cr> `t', opts)

--Telescope
themes = require('telescope.themes')
builtin = require('telescope.builtin')
compact_dropdown = themes.get_dropdown{previewer = false, hidden = true}
extensions = require('telescope').extensions

map('n', '<C-p>', ":lua builtin.git_files(compact_dropdown)<cr>", opts)
map('n', '<M-p>', ":lua builtin.fd(compact_dropdown)<cr>", opts)
map('n', '<C-n>', ":Telescope builtin<cr>", opts)
map('n', '<C-g>', ":lua builtin.live_grep(themes.get_ivy())<cr>", opts)

--Unbind visual K
map('v', 'K', '', opts)

--Terminal window, visual glitches
map('n', '<leader>t', ':vs<cr>:terminal<cr>i', opts)
