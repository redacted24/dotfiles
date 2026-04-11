-- autocomplete
return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "saadparwaiz1/cmp_luasnip",
        {
            "folke/lazydev.nvim", -- LSP for vim
            ft = "lua",           -- only load on lua files
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    opts = function()
        vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })

        vim.treesitter.language.register('markdown', 'cmp_docs')

        require("luasnip.loaders.from_snipmate").lazy_load()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        return {
            auto_brackets = {},
            snippet = {
                expand = function(args)
                    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    require("luasnip").lsp_expand(args.body) -- for luasnip
                end,
            },
            preselect = cmp.PreselectMode.Item,
            window = {
                -- completion = cmp.config.window.bordered(),
                documentation = {
                    winhighlight = "Normal:Pmenu,Inactive:Pmenu,FloatBorder:Pmenu,Search:None"
                }
            },
            completion = {
                -- autocomplete = false;
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(4),
                ["<C-f>"] = cmp.mapping.scroll_docs(-4),
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip",                max_item_count = 2 },
                { name = "nvim_lsp" },
                -- { name = 'cmdline' },
            }, {
                { name = "buffer", max_item_count = 3 },
                { name = "path" },
            }),

            formatting = {
                fields = { 'abbr', 'icon', 'kind', 'menu' },
                format = lspkind.cmp_format({
                    maxwidth = {
                        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        -- can also be a function to dynamically calculate max width such as
                        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                        menu = 50,            -- leading text (labelDetails)
                        abbr = 50,            -- actual suggestion item
                    },
                    ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#29](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        -- ...
                        return vim_item
                    end
                })

                -- format = function(entry, item)
                -- 	require("lspkind").cmp_format({
                -- 		preset = "default",
                -- 		mode = "symbol_text",
                -- 		maxwidth = 50,
                -- 		ellipsis_char = "...",
                --                     show_labelDetails = false,
                -- 		menu = {
                -- 			buffer = "[Buffer]",
                -- 			nvim_lsp = "[LSP]",
                -- 			luasnip = "[LuaSnip]",
                -- 			path = "[Path]",
                -- 			cmdline = "[Cmdline]",
                --                         nvim_lsp_signature_help = "[Signature]"
                -- 		},
                -- 	})(entry, item)
                --
                -- 	local widths = {
                -- 		abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 70,
                -- 		menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
                -- 	}
                --
                -- 	for key, width in pairs(widths) do
                -- 		if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                -- 			item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                -- 		end
                -- 	end
                --
                --                 local details = entry:get_completion_item().detail
                --
                --                 return item
                -- end,
            },
            performance = {
                max_view_entries = 15,
                max_item_count = 15,
            },

            view = {
                docs = {
                    auto_open = true,
                },
            },
            -- experimental = {
            --     ghost_text = true,
            -- }
        }
    end,
}
