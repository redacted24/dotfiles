-- lsp configuration
return {
	"neovim/nvim-lspconfig",

	branch = "master",

	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/nvim-cmp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"onsails/lspkind.nvim",
	},

	config = function()
		-- LSP KEYBINDS SETUP
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP keybindings",
			callback = function(event)
				local opts = { buffer = event.buf }
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				-- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_prev()
				end, opts)
			end,
		})

		-- MASON SETUP
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = false
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { 
                "jdtls", 
                "clangd", 
                -- "bash-language-server", 
                -- "python-lsp-server",
                -- "rubocop",
                -- "ruby-lsp",
                -- "luaformatter",
                -- "asm-lsp"
            },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		})

		-- VIM DIAGNOSTICS SETUP
		vim.diagnostic.config({
			virtual_text = false,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = false,
		})
	end,
}
