vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.wo.relativenumber = true


vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>luasnip-expand-or-jump", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-k>", "<Plug>luasnip-expand-or-jump", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>luasnip-jump-next", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-j>", "<Plug>luasnip-jump-next", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>luasnip-jump-prev", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-l>", "<Plug>luasnip-jump-prev", { noremap = true, silent = true })
