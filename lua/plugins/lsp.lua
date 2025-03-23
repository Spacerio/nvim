local config = function()
	local ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd", "nixd", "nil_ls", "csharp_ls" }
	require('mason').setup()
	-- require("mason-lspconfig").setup {
	-- 	ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd" },
	-- }

	-- local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
	local lsp_capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- lsp_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

	local lsp_remaps = function(bufnr)
		local opts = { remap = true, silent = true, buffer = bufnr }
		-- TODO: figure out a better way to do this
		-- or only show diagnostics on the current line
		vim.keymap.set('n', '[ov', '<cmd>lua vim.diagnostic.config{virtual_text=false}<cr>', opts)
		vim.keymap.set('n', ']ov', '<cmd>lua vim.diagnostic.config{virtual_text=true}<cr>', opts)
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
		virtual_text = {
			virt_text_pos = 'eol_right_align'
		},
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
			"folke/lazydev.nvim",
			enabled = true,
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					{ path = "snacks.nvim" , words = { "Snacks" } }
				},
			},
		},

		{
			"ray-x/lsp_signature.nvim",
			event = "InsertEnter",
			opts = {
				bind = true,
				floating_window = true,
				handler_opts = {
					border = "rounded"
				}
			},
		}
	},
	keys = {
		vim.keymap.set('n', '<leader>m', '<cmd>Mason<cr>', {silent = true})
	}
}
