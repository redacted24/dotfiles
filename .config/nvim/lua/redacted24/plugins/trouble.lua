return {
        -- require('lspconfig').pylsp.setup {
        --     settings = {
        --         pylsp = {
        --             plugins = {
        --                 pyflakes = {enabled = false},
        --                 pycodestyle = {enabled = false},
        --                 mccabe = {enabled = false}
        --             }
        --         }
        --     }
        -- }
        -- require('lspconfig')['eslint'].setup {
        --     capabilities = capabilities
        -- }
        -- require('lspconfig')['tsserver'].setup {
        --     capabilities = capabilities
        -- }
        -- require('lspconfig')['ruby_lsp'].setup {
        --     capabilities = capabilities
        -- }

    "folke/trouble.nvim",

    opts = {
        
        auto_preview = true,
        focus = true,
        modes = {
            preview_float = {
                mode = "diagnostics",
                preview = {
                    type = "float",
                    scratch = true,
                    relative = "editor",
                    border = "rounded",
                    title = "Preview",
                    title_pos = "center",
                    position = { 0, -2 },
                    size = { width = 0.3, height = 0.3 },
                    zindex = 200,
                },
            },
        },
    },    



    cmd = "Trouble",

    keys = {
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },

        -- {

        --     "<leader>xX",
        --     "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        --     desc = "Buffer Diagnostics (Trouble)",
        -- },
        -- {
        --     "<leader>cs",
        --     "<cmd>Trouble symbols toggle focus=false<cr>",
        --     desc = "Symbols (Trouble)",
        -- },
        -- {
        --     "<leader>cl",
        --     "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        --     desc = "LSP Definitions / references / ... (Trouble)",
        -- },
        -- {
        --     "<leader>tl",
        --     "<cmd>Trouble loclist toggle<cr>",
        --     desc = "Location List (Trouble)",
        -- },
        -- {
        --     "<leader>qf",
        --     "<cmd>Trouble qflist toggle<cr>",
        --     desc = "Quickfix List (Trouble)",
        -- },
    },

}
