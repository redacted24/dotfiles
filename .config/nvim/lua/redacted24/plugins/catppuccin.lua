-- catppuccin theme for neovim
return {
    'catppuccin/nvim',

    as = 'catppuccin',

    lazy = false,

    config = function()
        vim.cmd('colorscheme catppuccin-macchiato')
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}
