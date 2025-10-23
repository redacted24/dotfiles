-- lsp configuration
return {
    'neovim/nvim-lspconfig',

    branch = 'master',

    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind.nvim',
        'L3MON4D3/LuaSnip',
    },


    config = function()
        local cmp = require("cmp")

        cmp.setup({
            auto_brackets = {},
            snippet = {
                expand = function(args)
                    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    require('luasnip').lsp_expand(args.body); -- for luasnip
                end,
            },
            preselect = cmp.PreselectMode.Item,
            window = {
                completion = cmp.config.window.bordered(),
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
                { name = 'luasnip' },
            }, {
                { name = 'buffer', max_item_count = 3 }
            }),
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, item)
                    require("lspkind").cmp_format({
                        preset = 'default',
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                        menu = {
                            buffer = '[Buffer]',
                            nvim_lsp = '[LSP]',
                            luasnip = '[LuaSnip]',
                        },
                    })(entry, item)

                    local widths = {
                        abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 50,
                        menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
                    }

                    for key, width in pairs(widths) do
                        if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                            item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                        end
                    end

                    return item
                end,
            },
            performance = {
                max_view_entries = 15
            },

            view = {
                docs = {
                    auto_open = true
                }
            },
        })
        require('cmp_nvim_lsp').default_capabilities()

        -- LSP KEYBINDS SETUP
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP keybindings',
            callback = function(event)
                local opts = {buffer = event.buf}
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
            end
        })

        -- MASON SETUP
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'jdtls', 'clangd'},
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
        })
    end
}
