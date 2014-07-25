" pathogen and other shit
execute pathogen#infect()
syntax enable
filetype plugin indent on

" numbers
set number

" tabs are 4 spaces 
set softtabstop=4 
set shiftwidth=4 
set tabstop=4
set expandtab

" cool colors
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" for ctags
set tags=./tags,tags;

" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
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

" ===== mappings ====

" ctags
" TODO: why doesn't this work
inoremap <C-Space> <C-]>


