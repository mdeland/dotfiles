" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set cursorline                                               " highlight current line
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set hlsearch                                                 " highlight matches
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set lazyredraw                                               " redraw only when we need to.
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
" set nocursorline                                             " don't highlight current line
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set showmatch                                                " highlight matching [{()}]
set softtabstop=2                                            " insert mode tab and backspace use 2 space
set tabstop=4                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
" let mapleader = ','
let mapleader = "\<Space>"
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
inoremap jj <ESC>
noremap <leader>l :Align
nnoremap <leader>, :nohlsearch<CR>
nnoremap <leader>a :Ag<space>
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>
nnoremap <silent> <Leader>B :BuffergatorClose<CR>
nnoremap <silent> <Leader>to :BuffergatorTabsOpen<CR>
nnoremap <silent> <Leader>tc :BuffergatorTabsClose<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
" nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>c <Plug>Kwbd
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>o :set paste!<CR>
map q: :q

" gui settings
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  autocmd WinEnter term://* startinsert
endif

" plugin settings
let g:buffergator_suppress_keymaps=1
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:gitgutter_enabled = 0
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:haskell_folding=0
let g:NERDSpaceDelims=1

let g:pymode_folding=0
let g:pymode_rope = 0
let g:syntastic_python_checkers = ['python', 'pyflakes', 'pylint']

" Make Ctrl-P plugin a lot faster for Git projects
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Wagon helpers: set syntastic linters based on file header
let g:syntastic_javascript_eslint_exec = 'npm-exec-eslint'
autocmd FileType javascript let b:syntastic_checkers = matchstr(getline(0,1), '/\* use-jshint \*/') != '' ? ['jshint'] : ['eslint']

