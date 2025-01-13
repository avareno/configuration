-- Add go.nvim to your Neovim configuration
return {
	{
		"ray-x/go.nvim",
		dependencies = { "ray-x/guihua.lua" }, -- Optional GUI enhancements
		config = function()
			require("go").setup({
				goimports = "gopls", -- Use gopls for imports
				gofmt = "gopls", -- Use gopls for formatting
				tag_transform = false, -- No automatic struct tag transformation
				test_runner = "go", -- Use the Go CLI for running tests
				lsp_cfg = true, -- Auto-configure LSP (gopls)
				lsp_on_attach = true, -- Attach LSP automatically
				dap_debug = true, -- Enable debugging support
			})

			-- Keybindings for Go-specific features
			vim.keymap.set("n", "<leader>Gr", ":GoRun<CR>", { desc = "Run Go file" })
			vim.keymap.set("n", "<leader>Gb", ":GoBuild<CR>", { desc = "Build Go project" })
			vim.keymap.set("n", "<leader>Gt", ":GoTest<CR>", { desc = "Run Go tests" })
			vim.keymap.set("n", "<leader>Gi", ":GoInstallDeps<CR>", { desc = "Install Go dependencies" })
			vim.keymap.set("n", "<leader>Gf", ":GoFmt<CR>", { desc = "Format Go file" })
			vim.keymap.set("n", "<leader>Gd", ":GoDoc<CR>", { desc = "Open Go documentation" })
			-- vim.keymap.set("n", "<leader>gg", ":GoGenerate<CR>", { desc = "Run Go generate" })
			vim.keymap.set("n", "<leader>GD", ":GoDebugStart<CR>", { desc = "Start Go debugger" })
		end,
	},
}
