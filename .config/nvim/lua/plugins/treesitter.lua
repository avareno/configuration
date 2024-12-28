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
				"blade",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false, -- Tree-sitter only
			},
			indent = {
				enable = true,
			},
		})

		-- Correct Blade parser configuration
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = { "src/parser.c" },
				branch = "main",
			},
			filetype = "php", -- Use PHP filetype for blade highlighting
		}

		-- Set *.blade.php to filetype php for consistent highlighting
		vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
			pattern = "*.blade.php",
			callback = function()
				vim.bo.filetype = "php"
			end,
		})
	end,
}
