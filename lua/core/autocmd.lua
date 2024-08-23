local os = require("os")

local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

if not vim.fn.has('linux') then
	vim.api.nvim_create_autocmd(
		{"VimEnter"},

		{ pattern = "*", command = "cd " .. os.getenv("USERPROFILE"), group = vim_enter_group }
	)
end

-- vim.api.nvim_create_autocmd(
-- 	{"BufWinEnter", "BufEnter"},
-- 	{
-- 		group = vim.api.nvim_create_augroup("CloseToc", { clear = true }),
-- 		pattern = { "qf", "help" },
-- 		callback = function(ev)
-- 			print(vim.inspect(ev.buf))
-- 			vim.keymap.set("<cr>", "<cr><C-w>p:q<cr>", { buffer = true, silent = true})
-- 		end,
-- 	}
-- )

-- vim.api.nvim_create_autocmd(
-- 	{"ExitPre"},
-- 	{
-- 		callback = function()
-- 			vim.cmd("LspStop 1 2 3 4 5 6")
-- 			-- vim.lsp.stop_client(vim.lsp.get_clients())
-- 		end
-- 	}
-- )

-- local function get_git_root()
-- 	local dot_git_path = vim.fn.finddir(".git", ".;")
-- 	return vim.fn.fnamemodify(dot_git_path, ":h")
-- end

-- vim.api.nvim_create_autocmd(
-- 	{"BufEnter", "BufWinEnter"},
-- 	{ callback = function ()
-- 		vim.api.nvim_set_current_dir(get_git_root())
-- 	end}
-- )
