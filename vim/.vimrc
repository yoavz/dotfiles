" pre-settings
execute pathogen#infect()
syntax enable
filetype plugin indent on

"""""""""""""""
" basic options
"""""""""""""""
set encoding=utf-8
set number
set visualbell
set ff=unix

" copy/paste from and to clipboard
set clipboard=unnamed

" tabs are 4 spaces 
set softtabstop=4 
set shiftwidth=4 
set tabstop=4
set expandtab

" Enable mouse use in all modes
set mouse=a
set ttymouse=xterm2

" highlight all searches
set hlsearch
set incsearch

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

" for ctags
set tags=./tags,tags;

" lightline
set guifont=Source\ Code\ Pro\ ExtraLight\ for\ Powerline:h12,Menlo:h14
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

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
let g:ctrlp_custom_ignore = 'pyc\|DS_Store'

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

nnoremap <C-w>s :SyntasticCheck<CR> 

""""""""""
" mappings 
""""""""""

" wrapped line control
:nmap j gj
:nmap k gk

" redo
:nmap r <C-r>

" ctags
" TODO: why doesn't this work

nnoremap <C-Space> <C-]>

"""""""""""""""""""
" filetype-specific
"""""""""""""""""""

" indent html/css/js by 2 instead of 4
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sass setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2

" haskell should also use 2 instead of 4
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType lhaskell setlocal shiftwidth=2 tabstop=2 softtabstop=2

" c/c++ should use 2 instead of 4
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2
