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
				"rust",
				"go",
				"php",
				"python",
				"java",
				"dart",
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
