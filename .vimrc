filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
syntax on

colorscheme hammer
set number
set relativenumber
set ignorecase
set smartcase
set gdefault
"set nocompatible
set autoindent
set incsearch
set showmatch
set hlsearch
set backupdir=~/.vim/backup
set autowrite
set autowriteall

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader><space> :noh<cr>

nmap :bd <plug>Kwbd
au FocusLost * :wa

