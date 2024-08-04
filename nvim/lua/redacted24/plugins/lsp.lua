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
                ['<C-p>'] = cmp.mapping.scroll_docs(-1),
                ['<C-n>'] = cmp.mapping.scroll_docs(1),
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
                'tsserver'
            },

            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            },
        })
    end
}
