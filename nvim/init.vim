set hlsearch
set noswapfile
syntax on
set number
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set cursorline
" plugins

call plug#begin()

Plug 'catppuccin/nvim'
Plug 'pocco81/auto-save.nvim'
Plug 'folke/which-key.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

call plug#end()

colorscheme catppuccin-mocha
