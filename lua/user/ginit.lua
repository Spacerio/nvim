if vim.g.neovide then
	vim.cmd "let g:neovide_transparency = 0.75"
	vim.cmd "let g:neovide_fullscreen = v:true"
	vim.cmd "let g:neovide_cursor_trail_size = 0.1"

	local function ToggleTransparency()
		if vim.g.neovide_transparency == 1.0 then
			vim.cmd "let g:neovide_transparency = 0.75"
		else 
			vim.cmd "let g:neovide_transparency = 1.0"
		end
	end

	local function ToggleFullscreen()
		if vim.g.neovide_fullscreen == false then
			vim.cmd "let g:neovide_fullscreen = v:true"
		else
			vim.cmd "let g:neovide_fullscreen = v:false"
		end
	end

	vim.keymap.set('n', '<F11>', ToggleFullscreen, { silent = true })
	vim.keymap.set('n', '<F10>', ToggleTransparency, { silent = true })
end
