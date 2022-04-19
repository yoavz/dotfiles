" pre-settings
syntax enable
filetype plugin indent on

""""""""""""""
" plugin setup
""""""""""""""

" Install Plug if not already installed.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'python/black'
Plug 'junegunn/fzf.vim'         " fuzzy matching
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'junegunn/vim-emoji'
Plug 'jparise/vim-graphql'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf'
endif
if isdirectory($HOME . '/.local/fzf')
  Plug $HOME . '/.local/fzf'
endif

call plug#end()


"""""""""""""""
" basic options
"""""""""""""""
set encoding=utf-8
set number
set visualbell
set ff=unix

" copy/paste from and to clipboard
set clipboard=unnamed

" backspace works regularly
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start

" tabs are 4 spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

" Enable mouse use in all modes
set mouse=a

" highlight all searches
set hlsearch
set incsearch

" current file is always set to current directory
set autochdir

" resize splits on window resize
au VimResized * exe "normal! \<c-w>"

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" strip whitespace
autocmd BufWritePre * %s/\s\+$//e

""""""""""""""""
" color settings
""""""""""""""""

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" abbreviations
iabbrev ldis ಠ_ಠ

"""""""""
" plugins
"""""""""

" for coc navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> cc :CocCommand

" for coc gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" airline + coc
let g:airline#extensions#coc#enabled = 1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " tab completion
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Ack
let g:ack_default_options = " -H --nocolor --nogroup --column"


" Ctrl P
let g:ctrlp_custom_ignore = 'node_modules\|pyc\|DS_Store'

" Open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.html Prettier

" Emojis
set completefunc=emoji#complete

""""""""""
" mappings
""""""""""

" wrapped line control
:nmap j gj
:nmap k gk

" redo
:nmap r <C-r>

" ` -> escape key
:cmap ` <Esc>
:nmap ` <Esc>
:vmap ` <Esc>
let g:ctrlp_prompt_mappings = {
\ 'PrtExit()':            ['<esc>', '`'],
\ }

" jj -> escape key training
:imap jj <Esc>
:cmap jj <Esc>

:nmap <silent> an :ALENext<cr>
:nmap <silent> ab :ALEPrevious<cr>

nnoremap <C-Space> <C-]>

"""""""""""""""""""
" filetype-specific
"""""""""""""""""""

" indent html/css/js by 2 instead of 4
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sass setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2

" haskell should also use 2 instead of 4
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType lhaskell setlocal shiftwidth=2 tabstop=2 softtabstop=2

" c/c++ should use 2 instead of 4
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2

" matlab should use 2 instead of 4
autocmd FileType matlab setlocal shiftwidth=2 tabstop=2 softtabstop=2

" go should use tabs
autocmd FileType go setlocal expandtab!

" indent off for yaml
autocmd FileType yaml let b:did_indent = 1
autocmd FileType yaml setlocal indentexpr=

" Protect large files from sourcing and other overhead.
" Files become read only
if !exists("my_auto_commands_loaded")
  let my_auto_commands_loaded = 1
  " Large files are > 10M
  " Set options:
  " eventignore+=FileType (no syntax highlighting etc
  " assumes FileType always on)
  " noswapfile (save copy of file)
  " bufhidden=unload (save memory when other file is viewed)
  " buftype=nowritefile (is read-only)
  " undolevels=-1 (no undo possible)
  let g:LargeFile = 1024 * 1024 * 10
  augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
  endif
