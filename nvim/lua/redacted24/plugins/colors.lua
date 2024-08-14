function ColorMyPencils(color)
    color = color or 'catppuccin-mocha'
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function LockIn()
    -- check if background is transparent or not
    current_color = vim.api.nvim_get_hl(0, {name = 'Normal'})['bg']

    if current_color ~= nil then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        print('set transparent background')

    elseif vim.g.colors_name == 'catppuccin-mocha' then
        vim.api.nvim_set_hl(0, "Normal", { bg = 1973807 })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = 1973807 })
        print('set opaque catppuccin-mocha background')

    elseif vim.g.colors_name == 'rose-pine' then
        vim.api.nvim_set_hl(0, "Normal", { bg = 1644324 })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = 1644324 })
        print('set opaque rose-pine background')
    end
end

function PeepBackgroundState()
    print('currently using', vim.g.colors_name)
    print('background is currently', vim.api.nvim_get_hl(0, {name='Normal'})['bg'])
end

return {
    'rose-pine/neovim',

    name = 'rose-pine'
}
