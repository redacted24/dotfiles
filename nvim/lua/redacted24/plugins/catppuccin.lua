return {
    'catppuccin/nvim',
    
    as = 'catppuccin',

    lazy = false,

    config = function()
        vim.cmd('colorscheme catppuccin-mocha')
    end
}
