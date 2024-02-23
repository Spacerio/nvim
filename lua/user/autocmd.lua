local os = require("os")

local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

if not vim.fn.has('linux') then
	vim.api.nvim_create_autocmd(
		{"VimEnter"},

		{ pattern = "*", command = "cd " .. os.getenv("USERPROFILE"), group = vim_enter_group }
	)
end

local function get_git_root()
	local dot_git_path = vim.fn.finddir(".git", ".;")
	return vim.fn.fnamemodify(dot_git_path, ":h")
end

vim.api.nvim_create_autocmd(
	{"BufEnter", "BufWinEnter"},
	{ callback = function ()
		vim.api.nvim_set_current_dir(get_git_root())
	end}
)
