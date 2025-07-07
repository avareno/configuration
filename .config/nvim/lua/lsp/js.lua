local M = {}

M.setup = function()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		callback = function()
			vim.bo.expandtab = true
			vim.bo.tabstop = 2
			vim.bo.softtabstop = 2
			vim.bo.shiftwidth = 2
		end,
	})
end

return M
