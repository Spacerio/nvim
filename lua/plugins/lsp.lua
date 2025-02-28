local config = function()
	local ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd", "nil_ls" },
	require('mason').setup()
	-- require("mason-lspconfig").setup {
	-- 	ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd" },
	-- }

	local lsp_capabilities = vim.tbl_deep_extend("force",
		vim.lsp.protocol.make_client_capabilities(),
		require('cmp_nvim_lsp').default_capabilities()
	)
	-- lsp_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

	local lsp_remaps = function(bufnr)
		local opts = { remap = true, silent = true, buffer = bufnr }
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'gO', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
		vim.keymap.set('n', 'ga', '<cmd>Telescope treesitter<cr>', opts)
		vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		vim.keymap.set('x', 'gs', '<cmd>lua vim.lsp.buf.range_code_action()<cr>', opts)
		-- vim.keymap.set('n', 'gO', '<cmd>Telescope lsp_document_symbols<cr>', opts)
		-- Diagnostics
		-- vim.keymap.set('n', 'gl', '<cmd>TroubleToggle<cr>', opts)
		vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
		vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
		vim.keymap.set('n', '[v', '<cmd>lua vim.diagnostic.config{virtual_text=false}<cr>', opts)
		vim.keymap.set('n', ']v', '<cmd>lua vim.diagnostic.config{virtual_text=true}<cr>', opts)
	end

	local function lsp_attach(client, bufnr)
		lsp_remaps(bufnr)
	end

	local opts = {
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
		autostart = true,
		single_file_support = true,
	}


	local setup_servers = function(server_name)
			local lspconfig = require('lspconfig')
			local has_custom_opts, custom_opts = pcall(require, "util.lsp." .. server_name)
			lspconfig[server_name].setup(has_custom_opts and vim.tbl_deep_extend("force", opts, custom_opts) or opts)
	end
	if vim.g.system_id == 'nixos' then
		for _, server_name in ipairs(ensure_installed) do
			setup_servers(server_name)
		end
	else
		-- vim.list_extend(ensure_installed, extra_tools)
		-- require('mason-tool-installer').setup { ensure_installed = ensure_installed }
		-- require('mason-lspconfig').setup { handlers = { setup_servers } }
		require('mason-lspconfig').setup_handlers({
			setup_servers
		})
	end



	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = false,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})
end

return { 'neovim/nvim-lspconfig',
	lazy = false,
	config = config,
	dependencies = {
		{ 'williamboman/mason.nvim', },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'simrat39/rust-tools.nvim' },
		{
			'folke/neodev.nvim',
			enabled = true,
			opts = {
				library = {
					enabled = true,
					runtime = true,
					plugins = false,
					types = true,
				}
			}
		},
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
			opts = {
				floating_window = false,
			},
		}
	},
	keys = {
		vim.keymap.set('n', '<leader>m', '<cmd>Mason<cr>', {silent = true})
	}
}
