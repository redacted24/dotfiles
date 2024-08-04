function ColorMyPencils(color)
    color = color or 'catppuccin-mocha'
    vim.cmd.colorscheme(color)
end

return {
    'rose-pine/neovim',
    
    name = 'rose-pine'
}
