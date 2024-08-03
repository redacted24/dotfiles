require('redacted24.remap')
require('redacted24.set')
require('redacted24.lazy_init')
require('lazy').setup({
    spec = 'redacted24.plugins',
    -- ui = {
    --     border = 'single',
    --     size = {
    --         width = 0.5,
    --         height = 0.5,
    --     },
    -- },
    checker = {
        enabled = true,
        notify = true
    }
})


