return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
				-- format_on_save = function(bufnr)
				-- 	-- Disable with a global or buffer-local variable
				-- 	if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				-- 		return
				-- 	end
				-- 	return { timeout_ms = 500, lsp_format = "fallback" }
				-- end,
			})

			vim.keymap.set({ "n", "v" }, "<leader>l", function()
				conform.format({
					lsp_fallback = false,
					async = false,
					timeout_ms = 500,
				})
				print("Formatted")
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
}
