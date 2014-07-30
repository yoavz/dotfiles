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
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
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


""""""""""
" mappings 
""""""""""
" ctags
" TODO: why doesn't this work
nnoremap <C-Space> <C-]>


