return {
    'neovim/nvim-lspconfig',

    branch = 'master',

    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline'
    },

    config = function()

        local cmp = require'cmp'
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        -- CMP SETUP
        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },

            window = {
                -- completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },

            }, {
                    { name = 'buffer' },
                }),

            performance = {
                max_view_entries = 5
            },

            -- experimental = {
            --     ghost_text = true
            -- },
        })
        
        -- LSP KEYBINDS SETUP
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP keybindings',
            callback = function(event)
                local opts = {buffer = event.buf}

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
                -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end
        })

        -- LSPCONFIG SETUP
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('lspconfig')['eslint'].setup {
            capabilities = capabilities
        }
        require('lspconfig')['tsserver'].setup {
            capabilities = capabilities
        }
        
        -- MASON SETUP
        require('mason').setup({})

        require('mason-lspconfig').setup({
            ensure_installed = {
                'pylsp',
                'eslint',
                'tsserver',
            },

            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
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
            -- preview = {
            --     type = "float",
            --     relative = "editor",
            --     border = "rounded",
            --     title = "Preview",
            --     title_pos = "center",
            --     position = { 0, -2 },
            --     size = { width = 0.3, height = 0.3 },
            --     zindex = 200,
            -- },
        })
    end
}
