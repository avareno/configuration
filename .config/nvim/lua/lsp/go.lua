local lspconfig = require("lspconfig")
local common = require("lsp.common")

lspconfig.gopls.setup({
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      completeUnimported = true,
    },
  },
})