local M = {}

local is_inside_work_tree = {}
M.project_files = function()
	local opts = { compact_dropdown }
	local builtin = require('telescope.builtin')
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

M.grep = function()
	local themes = require('telescope.themes')
	local compact_dropdown = themes.get_dropdown { previewer = false, hidden = true }
	local extensions = require('telescope').extensions
	local builtin = require('telescope.builtin')
	builtin.live_grep(themes.get_ivy())
end

M.hgrep = function()
	local themes = require('telescope.themes')
	local compact_dropdown = themes.get_dropdown { previewer = false, hidden = true }
	local extensions = require('telescope').extensions
	require("telescope-helpgrep").grep_string(themes.get_ivy())
end

return M
