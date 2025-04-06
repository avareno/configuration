local lspconfig = require("lspconfig")
local common = require("lsp.common")

lspconfig.ts_ls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
})

lspconfig.eslint.setup({
	on_attach = require("lsp.common").on_attach,
	capabilities = require("lsp.common").capabilities,
	settings = {
		workingDirectory = { mode = "auto" },
	},
})
