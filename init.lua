require("core.options")
require("core.remap")
require("core.autocmd")

if vim.g.neovide then
	require("core.gui")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local opts = {
	defaults = {
		lazy = true
	},
	install = {
		colorscheme = { "catpuccin" }
	},
	change_detection = {
		notify = false
	}
}

require("lazy").setup("plugins", opts)
