local lspconfig = require("lspconfig")
local common = require("lsp.common")

lspconfig.rust_analyzer.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
})
