colorscheme lena
" Display line numbers
set number

" Always show at least one line above/below the cursor.
set scrolloff=1
" Always show at least one line left/right of the cursor.
set sidescrolloff=5

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Use system clipboard
set clipboard=unnamedplus

" Fix indentation
map <F7> gg=G<C-o><C-o>

" Toggle vertical line
set colorcolumn=
fun! ToggleCC()
  if &cc == ''
    " set cc=1,4,21
    set cc=80
  else
    set cc=
  endif
endfun
nnoremap <silent> <F9> :call ToggleCC()<CR>

" Indentation
set smarttab
set expandtab
set tabstop=8
set softtabstop=2
set shiftwidth=2
set autoindent
set nocompatible
filetype plugin indent on

" Mouse support
set mouse=a

"Case insensitive searching
set ignorecase
"Will automatically switch to case sensitive if you use any capitals
set smartcase

" If lightline/airline is enabled, don't show mode under it
set noshowmode
