local opts = {
	backup = false,                          -- creates a backup file
	-- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
	cmdheight = 2,                           -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0,                        -- so that `` is visible in markdown files
	fileencoding = "utf-8",                  -- the encoding written to a file
	hlsearch = false,                        -- highlight all matches on previous search pattern
	incsearch = true,						 -- help with searches
	ignorecase = true,                       -- ignore case in search patterns
	mouse = "a",                             -- allow the mouse to be used in neovim
	pumheight = 10,                          -- pop up menu height
	showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
	smartcase = true,                        -- smart case
	smartindent = true,                      -- make indenting smarter again
	splitbelow = true,                       -- force all horizontal splits to go below current window
	splitright = true,                       -- force all vertical splits to go to the right of current window
	swapfile = false,                        -- creates a swapfile
	termguicolors = true,                    -- set term gui colors (most terminals support this)
	timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,                         -- enable persistent undo
	updatetime = 50,                         -- faster completion (4000ms default)
	makeprg="make -s",
	autochdir = false,
	linebreak = true,
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false,                       -- convert tabs to spaces (disable)
	shiftwidth = 4,                          -- the number of spaces inserted for each indentation
	tabstop = 4,                             -- insert 2 spaces for a tab
	cursorline = false,                       -- highlight the current line
	number = true,                           -- set numbered lines
	relativenumber = true,                   -- set relative numbered lines
	numberwidth = 4,                         -- set number column width to 2 {default 4}

	signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
	wrap = false,                            -- display lines as one long line
	scrolloff = 8,                          -- is one of my fav
	sidescrolloff = 8,
	-- guifont = "monospace:h17",               -- the font used in graphical neovim applications
	shortmess = "filnxtToOF", 				--Remove C to show amount of search results 
}

for k, v in pairs(opts) do
	vim.opt[k] = v
end

if vim.g.neovide then
	local os = require("os")
	local path_to_desktop = os.getenv("USERPROFILE") .. "\\Desktop"
	local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })
	vim.api.nvim_create_autocmd(
		{"VimEnter"},
		{ pattern = "*", command = "cd " .. path_to_desktop, group = vim_enter_group }
	)
end

-- check if running nixos

local system_name = vim.loop.os_uname().sysname

if system_name == 'Linux' then
	local file = io.open('/etc/os-release', 'r')
	if file then
    local content = file:read '*all'
    file:close()
    if string.find(content, 'ID=nixos') then
      vim.g.system_id = 'nixos'
    end
  end
end


vim.env.NOTES = "$HOME/Documents/Notes"
