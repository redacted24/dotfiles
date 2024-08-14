-- On vim enter, remove kitty spacing
vim.api.nvim_create_autocmd({'VimEnter'}, {
    pattern = {'*'},
    command = "!kitty @ set-spacing padding-left=0 padding-top=0 padding-right=0",
})

-- On vim exit, restore default kitty spacing
vim.api.nvim_create_autocmd({'VimLeave'}, {
    pattern = {'*'},
    command = "!kitty @ set-spacing default",
})
