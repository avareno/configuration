-- LSP Configuration Loader
return {
	{
		"nikvdp/ejs-syntax",
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"pyright",
					"rust_analyzer",
					"ts_ls",
					"eslint",
					"html",
					"cssls",
					"tailwindcss",
				},
				auto_install = true,
			})

			-- Setup default handlers for installed servers
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = require("lsp.common").on_attach,
						capabilities = require("lsp.common").capabilities,
					})
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Key mappings for LSP
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
			-- vim.keymap.set("n", "<C-h>", vim.lsp.buf.definition, { desc = "Go to definition" })
			-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

			-- Import specific language configurations from `lua/lsp`
			local lsp_configs = { "js" } -- Add other language configurations here
			for _, lang in ipairs(lsp_configs) do
				local ok, _ = pcall(require, "lsp." .. lang)
				if not ok then
					vim.notify("Failed to load LSP configuration for: " .. lang, vim.log.levels.ERROR)
				end
			end
		end,
	},
}
