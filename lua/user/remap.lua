local opts = { noremap = true, silent = true }
local remap = { silent = true }

local map = vim.keymap.set

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--plugin specific
map('n', '<leader>l', ':Lazy<cr>', opts)
map('n', '<leader>m', ':Mason<cr>', opts)
map('n', '<leader>h', ':<cr>', opts)
map('n', '<leader>e', ':Neotree toggle<cr>', opts)
map('n', '<leader>gg', ':LazyGit<cr>', opts)

map('i', '<C-BS>', '<C-w>', opts)

--Buffer navigation
map('n', 'L', ':bn<cr>', opts)
map('n', 'H', ':bp<cr>', opts)
map('n', '<M-l>', '<C-^>', opts)

--Emacs-like insert navigation
map('i', '<C-b>', '<left>', opts)
map('i', '<C-f>', '<right>', opts)
map('i', '<M-b>', '<C-left>', opts)
map('i', '<M-f>', '<C-right>', opts)

--Cmdline navigation
map('c', '<M-b>', '<S-Left>', {})
map('c', '<M-f>', '<S-Right>', {})
map('c', '<C-b>', '<Left>', {})
map('c', '<C-f>', '<Right>', {})
map('c', '<C-a>', '<Home>', {})

--Split navigation
-- map('n', '<C-h>', '<C-w>h', opts)
-- map('n', '<C-l>', '<C-w>l', opts)
-- map('n', '<C-j>', '<C-w>j', opts)
-- map('n', '<C-k>', '<C-w>k', opts)

-- map ö to ;
map('n', 'ö', ';', opts)
map('n', 'Ö', ':', {})
map('n', '¤', '$', opts)

map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('v', 'j', 'gj', opts)
map('v', 'k', 'gk', opts)

-- Better indent, stay in visual
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

--Switch ` and '
map('n', '\'', '`', opts)

--Better C-u and C-d
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Luasnip select
map("i", "<M-n>", "<Plug>luasnip-next-choice", opts)
map("s", "<M-n>", "<Plug>luasnip-next-choice", opts)
map("i", "<M-p>", "<Plug>luasnip-prev-choice", opts)
map("s", "<M-p>", "<Plug>luasnip-prev-choice", opts)
map('i', '<M-j>', '<cmd>lua require("luasnip").jump(-1)<cr>', opts)
map('s', '<M-j>', '<cmd>lua require("luasnip").jump(-1)<cr>', opts)
map('i', '<M-k>', '<cmd>lua require("luasnip").jump(1)<cr>', opts)
map('s', '<M-k>', '<cmd>lua require("luasnip").jump(1)<cr>', opts)

--harpoon
map('n', '<M-j><M-i>', ':lua require("harpoon.mark").add_file()<cr>', opts)
map('n', '<M-u>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
map('n', '<M-y>', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<cr>', opts)
map('n', '<M-j><M-a>', ':lua require("harpoon.ui").nav_file(1)<cr>', opts)
map('n', '<M-j><M-s>', ':lua require("harpoon.ui").nav_file(2)<cr>', opts)
map('n', '<M-j><M-d>', ':lua require("harpoon.ui").nav_file(3)<cr>', opts)
map('n', '<M-j><M-f>', ':lua require("harpoon.ui").nav_file(4)<cr>', opts)
map('n', '<M-j><M-j>', ':lua require("harpoon.ui").nav_file(5)<cr>', opts)
map('n', '<M-j><M-k>', ':lua require("harpoon.ui").nav_file(6)<cr>', opts)
map('n', '<M-j><M-l>', ':lua require("harpoon.ui").nav_file(7)<cr>', opts)
map('n', '<M-j><M-n>', ':lua require("harpoon.ui").nav_next()<cr>', opts)
map('n', '<M-j><M-p>', ':lua require("harpoon.ui").nav_prev()<cr>', opts)
map('n', '<M-j><M-q>', ':lua require("harpoon.tmux").gotoTerminal(1)<cr>i', opts)
map('n', '<M-j><M-w>', ':lua require("harpoon.tmux").gotoTerminal(2)<cr>', opts)
map('n', '<M-j><M-e>', ':lua require("harpoon.tmux").gotoTerminal(3)<cr>', opts)
map('n', '<M-j><M-r>', ':lua require("harpoon.tmux").gotoTerminal(4)<cr>', opts)
map('n', '<M-j><M-t>', ':lua require("harpoon.term").gotoTerminal(1)<cr>', opts)
map('n', '<M-j><M-y>', ':lua require("harpoon.term").gotoTerminal(2)<cr>', opts)

--Project switcher
map('n', '<leader>or', ':tabe<cr>:cd ~/AppData/Local/nvim<cr>:Telescope find_files<cr>', opts)
map('n', '<leader>on', ':tabe<cr>:cd ~/Documents/Notes<cr>:Telescope find_files<cr>', opts)

-- Dap keymaps
map('n', '<leader>B', ':lua require("dap").toggle_breakpoint()<cr>', opts)
map('n', '<F5>', ':lua require("dap").continue()<cr>', opts)
map('n', '<F10>', ':lua require("dap").step_over()<cr>', opts)
map('n', '<F11>', ':lua require("dap").step_into()<cr>', opts)
map('n', '<F12>', ':lua require("dap").step_out()<cr>', opts)
map('n', '<leader>rp', ':lua require("dap").repl.open()<cr>', opts)
map('n', '<leader>re', ':lua require("dap").terminate()<cr>', opts)
map('n', '<leader>rl', ':lua require("dap").run_last()<cr>', opts)
map('n', '<leader>rn', ':RustRunnables<cr>', opts)
map('n', '<leader>rd', ':RustDebuggables<cr>', opts)
map('n', '<leader>rr', '<cmd>vs | term cargo run<cr>i', opts)
map('n', '<leader>rr', function()
	vim.cmd("vs | term cargo run")
	vim.api.nvim_input("i")
end, opts)

map('n', 'gz', '<cmd>ZenMode<cr>', opts)

map('n', '<leader>q', '<cmd>SessionsSave<cr><cmd>qa!<cr>', opts)

--Format on keymap
map('n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<cr>', opts)

-- Delete other buffers
map('n', '<leader>D', ':mark t | w | %bd | e# | bd# <cr> `t', opts)

--Telescope
themes = require('telescope.themes')
builtin = require('telescope.builtin')
compact_dropdown = themes.get_dropdown { previewer = false, hidden = true }
extensions = require('telescope').extensions
map('n', '<C-n>', "<cmd>Telescope builtin<cr>", opts)
map('n', '<M-g>', "<cmd>lua builtin.live_grep(themes.get_ivy())<cr>", opts)
map('n', '<leader>b', '<cmd>Telescope file_browser<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', opts)
map('n', '<leader>fc', '<cmd>Telescope colorscheme<cr>', opts)
map('n', '<leader>ft', '<cmd>Telescope treesitter<cr>', opts)
map('n', '<leader>fO', '<cmd>Telescope vim_options<cr>', opts)
map('n', '<leader>ft', '<cmd>Telescope filetypes<cr>', opts)
map('n', '<leader>fH', '<cmd>Telescope command_history<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
map('n', '<leader>fp', '<cmd>Telescope man_pages<cr>', opts)
map('n', '<leader>fA', '<cmd>Telescope autocommands<cr>', opts)
map('n', '<leader>fm', '<cmd>Telescope marks<cr>', opts)
map('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', opts)
map('n', '<leader>fe', '<cmd>Telescope registers<cr>', opts)
map('n', '<leader>fl', '<cmd>Telescope neoclip<cr>', opts)
map('n', '<leader>z', '<cmd>lua require("telescope").extensions.zoxide.list({})<cr>', opts)
map('n', '<leader>fo', '<cmd>Telescope opener hidden=false respect_gitignore=true root_dir="~/Documents"<cr>', opts)
map('n', '<leader>p', '<cmd>Telescope projects<cr>', opts)

-- Leap.nvim
map('n', '\\', '<plug>(leap-forward-to)', opts)
map('n', '|', '<plug>(leap-backward-to)', opts)

--Unbind visual K and J
map('v', 'K', '', opts)
map('v', 'J', '', opts)

map('n', '<leader>cc', '<cmd>cd $NVIM<cr>', opts)
map('n', '<leader>co', '<cmd>cd $HOME/Documents/Notes<cr>', opts)

--Terminal window, visual glitches
map('n', '<leader>t', ':vs<cr>:terminal<cr>i', opts)

local make = function()
	local ft = vim.bo.filetype
	local make = function()
		if vim.fn.filereadable("makefile") then
			vim.cmd("vs | term make")
		else
			vim.cmd("! g++ % -o %<")
			vim.cmd("vs | term ./%<")
		end
		vim.api.nvim_input("i")
	end
	local case = {
		lua = function()
			vim.cmd("w")
			vim.cmd("source %")
		end,

		c = make,

		-- cpp = function ()
		-- 	vim.cmd("vs | term make %:r")
		-- 	vim.api.nvim_input("i")
		-- end,
		cpp = make,

		rust = function ()
			vim.cmd("!cargo run")
			-- also could use :compiler cargo :make run
		end,

		python = function()
			vim.cmd("vs | term python3 % i")
			vim.api.nvim_input("i")
		end,

		default = vim.api.nvim_input("<cr>")

	}

	vim.cmd("w")

	if case[ft] then
		case[ft]()
	-- else
	-- 	case["default"]()
	end
end

map('n', '<cr>', make, opts)

local is_inside_work_tree = {}

local project_files = function()
	local opts = { compact_dropdown }

	local cwd = vim.fn.getcwd()
	if is_inside_work_tree[cwd] == nil then
		vim.fn.system("git rev-parse --is-inside-work-tree")
		is_inside_work_tree[cwd] = vim.v.shell_error == 0
	end

	if is_inside_work_tree[cwd] then
		builtin.git_files(opts)
	else
		builtin.find_files(opts)
	end
end

map("n", "<C-p>", project_files, opts)
