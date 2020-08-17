source $HOME/.config/nvim/plugins.vim
" Set colorscheme
"set termguicolors
"set background=dark
syntax on
"colorscheme plastic
"let g:lightline = {'colorscheme': 'plastic'}

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
au BufRead,BufNewFile *.{css,scss,less} setlocal foldmethod=marker foldmarker={,}
au BufRead,BufNewFile *.{js,jsx,ts,tsx} setlocal foldmethod=syntax

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
set colorcolumn=80
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
set tabstop=2
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

let g:mapleader='\'

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>
" If lightline/airline is enabled, don't show mode under it
set noshowmode

" Backup files
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
if !isdirectory($HOME."/.cache/nvim")
  call mkdir($HOME."/.cache/nvim", 0770)
endif
set backupdir=~/.cache/nvim
set backup
set noswapfile

if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>b :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
" Quick window switching
nnoremap <C-S-h> <C-w>h
nnoremap <C-S-j> <C-w>j
nnoremap <C-S-k> <C-w>k
nnoremap <C-S-l> <C-w>l
" Quick tab switching
nnoremap <C-t>   :tabnew<CR>
nnoremap <C-j>   :tabprevious<CR>
nnoremap <C-k>   :tabnext<CR>
nnoremap <C-A-j> :tabmove -1<CR>
nnoremap <C-A-k> :tabmove +1<CR>
inoremap <C-t>   <ESC>:tabnew<CR>
inoremap <C-j>   <ESC>:tabprevious<CR>i
inoremap <C-k>   <ESC>:tabnext<CR>i
inoremap <C-A-j> <ESC>:tabmove -1<CR>i
inoremap <C-A-k> <ESC>:tabmove +1<CR>i

