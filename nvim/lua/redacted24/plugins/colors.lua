function ColorMyPencils(color)
    color = color or 'catppuccin-mocha'
    vim.cmd.colorscheme(color)
end

-- function SetTransparency()
--
--     if vim.api.nvim_get_hl(0, { name = 'Normal' })['bg'] ~= nil then
--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--         print('set transparent background')
--     else
--         -- Colors for Catppuccin
--         g:colors_name
--         vim.api.nvim_set_hl(0, "Normal", { bg = "1973807" })
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "1973907" })
--         print('set opaque background')
--     end
--
-- end

return {
    'rose-pine/neovim',
    
    name = 'rose-pine'
}
