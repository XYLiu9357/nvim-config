-- mason lsp config: more LSP servers are supported
return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"lua_ls",
				"pyright",
				"ruff",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})

			-- python lsp setup: pyright for text hover and ruff for linting and formatting
			lspconfig.pyright.setup({
				settings = {
					pyright = {
						-- using ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- ignore all files for analysis to exclusively use Ruff for linting
							ignore = { "*" },
						},
					},
				},
			})

			lspconfig.ruff.setup({
				init_options = {
					settings = {
						-- Ruff language server settings go here
						logLevel = "error",
					},
					lint = {
						enable = true,
						args = "--fix --select I", -- fix all fixable errors and sort imports
						run = "onSave", -- onType = every keystroke, or onSave
					},
				},
			})

			-- disable ruff hover in favor of pyright
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client == nil then
						return
					end
					if client.name == "ruff" then
						client.server_capabilities.hoverProvider = false
					end
				end,
				desc = "LSP: Disable hover capability from Ruff",
			})
		end,
	},
}
