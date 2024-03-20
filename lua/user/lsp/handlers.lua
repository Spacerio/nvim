require('mason').setup()
-- local dap = require("dap")
-- local dapui = require("dapui")

require("mason-lspconfig").setup {
	ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd" },
}

-- local rt = require("rust-tools")

-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_capabilities = vim.tbl_deep_extend("force",
  vim.lsp.protocol.make_client_capabilities(),
  require('cmp_nvim_lsp').default_capabilities()
)
-- lsp_capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

local lsp_remaps = function(bufnr)
	local map = function(m, lhs, rhs)
		local opts = { remap = true, silent = true, buffer = bufnr }
		vim.keymap.set(m, lhs, rhs, opts)
	end

	map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
	map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
	map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
	map('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>')
	map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
	map('n', 'gr', '<cmd>lua builtin.lsp_references()<cr>')
	map('n', 'gh', '<cmd>lua vim.lsp.buf.rename()<cr>')
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.code_action()<cr>', { remap = true, buffer = bufnr })
	map('x', 'gs', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
	-- Diagnostics
	map('n', 'gl', '<cmd>TroubleToggle<cr>')
	map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
	map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

local function lsp_attach(client, bufnr)
	lsp_remaps(bufnr)
end

local lspconfig = require('lspconfig')

local opts = {
	on_attach = lsp_attach,
	capabilities = lsp_capabilities,
	autostart = true,
	single_file_support = true,
}

require('mason-lspconfig').setup_handlers({
	function(server_name)
		-- local has_custom_opts, custom_opts = pcall(require, "user.lsp.settings." .. server_name)
		-- if has_custom_opts then
		-- 	opts = vim.tbl_deep_extend("force", opts, custom_opts)
		-- end
		lspconfig[server_name].setup(opts)
	end,
})

-- require("lspconfig").asm_lsp.setup {
-- 	on_attach = lsp_attach,
-- 	capabilities = lsp_capabilities,
-- 	cmd = { "asm-lsp" },
-- 	single_file_support = true,
-- }
--
-- local signs = {
-- 	{ name = "DiagnosticSignError", text = "" },
-- 	{ name = "DiagnosticSignWarn", text = "" },
-- 	{ name = "DiagnosticSignHint", text = "" },
-- 	{ name = "DiagnosticSignInfo", text = "" },
-- }
--
-- for _, sign in ipairs(signs) do
-- 	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
-- end
--
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
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
--
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- 	border = "rounded",
-- 	width = 60,
-- })
--
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
-- 	border = "rounded",
-- 	width = 60,
-- })
--
-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- local codelldb_adapter = {
-- 	type = "server",
-- 	port = "${port}",
-- 	executable = {
-- 		command = mason_path .. "bin/codelldb",
-- 		args = { "--port", "${port}" },
-- 	},
-- }
--
-- rt.setup({
-- 	server = {
-- 		on_attach = function(client, bufnr)
-- 			lsp_attach(client, bufnr)
-- 			vim.keymap.set('n', 'go', rt.hover_actions.hover_actions, { remap = true, buffer = bufnr })
-- 		end,
-- 		standalone = true,
-- 	},
-- 	dap = {
-- 		adapter = codelldb_adapter
-- 	},
-- 	tools = {
-- 		reload_workspace_from_cargo_toml = true,
-- 		runnables = {
-- 			use_telescope = true,
-- 		},
-- 		inlay_hints = {
-- 			max_len_align = true,
-- 		}
-- 	}
-- })
--
-- dap.adapters.codelldb = codelldb_adapter
-- dap.configurations.rust = {
-- 	{
-- 		name = "Launch file",
-- 		type = "codelldb",
-- 		request = "launch",
-- 		program = function()
-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 		stopOnEntry = false,
-- 	},
-- }
--
-- dap.listeners.after.event_initialized["dapui_config"] = function()
-- 	dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end
