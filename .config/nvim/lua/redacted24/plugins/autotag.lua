-- autotag: use treesitter to automatically open or close html tags
return {
    'windwp/nvim-ts-autotag',

    lazy = true,

    config = function()
        require('nvim-ts-autotag').setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false
            }
        })
    end
}
