local M = {}

M.on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- LSP Keybindings
  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<C-h>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
