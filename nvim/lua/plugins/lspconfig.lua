local clangd_cmd = {
	"clangd",
	"--header-insertion=never", -- Prevents automatic header insertion
	"--compile-commands-dir=.", -- Adjust as needed for your project
}

return {

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip"
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			local lsp_config = require("lspconfig")

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", "clangd"
				},
				handlers = {
					-- default handler, apply to every language server without
					-- a custom handler
					function(server_name)
						lsp_config[server_name].setup({})
					end,

					-- Lua
					lua_ls = function()
						lsp_config.lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" }
									}
								}
							}
						})
					end,
					clangd = function()-- Customize clangd command to specify C language mode
						lsp_config.clangd.setup {
							cmd = clangd_cmd,
						}
					end
				}
			})
		end
	}
}
