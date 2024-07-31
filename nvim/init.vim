set hlsearch
set noswapfile
syntax on
set number
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4

" plugins

call plug#begin()

Plug 'catppuccin/nvim'
Plug 'pocco81/auto-save.nvim'

call plug#end()

colorscheme catppuccin-mocha
