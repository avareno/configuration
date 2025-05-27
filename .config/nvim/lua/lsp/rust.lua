local lspconfig = require("lspconfig")
local common = require("lsp.common")

lspconfig.rust_analyzer.setup({
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      check = {
        command = "clippy", -- or "check"
      },
      diagnostics = {
        disabled = {
          "unresolved-proc-macro",
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
