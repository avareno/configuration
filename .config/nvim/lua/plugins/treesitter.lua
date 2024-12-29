return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- Treesitter configuration
		local ts_config = require("nvim-treesitter.configs")
		ts_config.setup({
			auto_install = true,
			ensure_installed = {
				"lua",
				"javascript",
				"go",
				"php",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false, -- Tree-sitter only
			},
			indent = {
				enable = true,
			},
		})

	end,
}
