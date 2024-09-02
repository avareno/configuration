return 
  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Treesitter config
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {"lua", "javascript", "go"},
        highlight = {enable = true},
        indent = {enable = true}
      })

      -- Treesitter keymapping
      --vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>')
    end
  }
