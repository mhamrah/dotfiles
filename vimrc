" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

" configure Vundle
" filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
call vundle#end()

filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=indent,eol,start
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=2                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>a :Ag<space>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <leader>z :ThematicNext<CR>

" in case you forgot to sudo
cmap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:agprg="ag --column --smart-case"

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
" vnoremap p "_dP

set nocursorline " don't highlight current line
set relativenumber

" keyboard shortcuts
inoremap jj <ESC>

"use ; as the command leader
nnoremap ; :
vnoremap ; :

set nospell
set showmode "show the mode you're in

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

set showmatch
set hlsearch
set autoread

set autowrite
set autowriteall
set nowritebackup

"disable backup and swaps
set nobackup
set noswapfile

"Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

if has("gui_running")
  set noballooneval
  set go-=T
endif

set title
set visualbell
set noerrorbells

set history=300
set undolevels=300

"split and move
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

"close window
map <leader>qw <C-w>q<cr>

"clear current search
nnoremap <leader>n :noh<cr>

if !has('gui_running')
  set term=screen-256color
endif

" gui settings
if (&t_Co == 256 || has('gui_running'))
  "colorscheme mlh256

  colorscheme lucius
  LuciusDarkHighContrast

  "colorscheme flatlandia
endif

"      \ 'mlh256': { },
"      \ 'flatlandia': { },
let g:thematic#defaults = {
      \'background': 'dark',
      \'airline-theme': 'ubaryd'
      \}
let g:thematic#themes = {
      \ 'hammer' :{'colorscheme': 'hammer'}
      \ }

"let g:thematic#theme_name = 'hammer'
autocmd! bufwritepost vimrc source ~/.vimrc

set laststatus=2                  " Show the status line all the time
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme='powerline'

"disable nerdtree from annoying startup mode
let g:nerdtree_tabs_open_on_gui_startup=0


" a little more informative version of the above
nmap <Leader>sI :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>


"whitespace management

autocmd FileType c,cpp,java,php,ruby,python,scala,javascript,json autocmd BufWritePre <buffer> :call whitespace#strip_trailing()

autocmd BufLeave,FocusLost,WinLeave,VimResized * silent! wall
autocmd BufEnter,CursorMoved,CursorMovedI,CursorHold,CursorHoldI * silent! checktime

" Disambiguate ,a & ,t from the Align plugin, making them fast again.
"
" This section is here to prevent AlignMaps from adding a bunch of mappings
" that interfere with the very-common ,a and ,t mappings. This will get run
" at every startup to remove the AlignMaps for the *next* vim startup.
"
" If you do want the AlignMaps mappings, remove this section, remove
" ~/.vim/bundle/Align, and re-run rake in maximum-awesome.
function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endif
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps

"ignore for ctrlp, etc
set wildignore+=*.class,*.swp,*.zip,*/target/*,*/resources/*
let g:ctrlp_working_path_mode = 'ra'

"Ctags, recursively search up
"Ctrl-], Ctrl-T to go back
set tags=tags;/

"Xmllint for xml formatting
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='\(hamrah\|gettyimages\|dsa\)'
au BufEnter *.scala setl formatprg=java\ -jar\ ~/gd/bin/scalariform.jar\ -f\ -q\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ --stdin\ --stdout
au BufEnter *.scala setl equalprg=java\ -jar\ ~/gd/bin/scalariform.jar\ -f\ -q\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ --stdin\ --stdout

"au BufEnter *.json setl equalprg=python -m json.tool
"reindent file, but stay on line
inoremap <leader>ri <ESC>gg=G<CR>''i
nnoremap <leader>ri gg=G<CR>''

autocmd filetype go set nolist

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec='/usr/local/bin/tidy'
let g:syntastic_html_tidy_ignore_errors = ['yo', 'mlh', 'proprietary attribute']

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

"let g:airline#extensions#tabline#enabled = 1
let g:bufferline_echo = 0
let g:bufferline_rotate = 2
"let g:airline#extensions#bufferline#enabled = 0

"let g:tmuxline_separators = {
"    \ 'left' : '',
"    \ 'left_alt': '>',
"    \ 'right' : '',
"    \ 'right_alt' : '<',
"    \ 'space' : ' '}
let g:vim_json_syntax_conceal = 0
let g:syntastic_ignore_files = ['.sbt']
