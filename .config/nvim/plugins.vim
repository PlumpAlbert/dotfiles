source $HOME/.config/nvim/autoload/plug.vim

" === ale ===
let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'css': ['prettier'],
      \ 'html': ['prettier'],
      \ 'json': ['prettier'],
      \ 'typescript': ['prettier'],
      \ '*': ['trim_whitespace'],
      \}
let g:ale_fix_on_save = 1

call plug#begin('~/.cache/vim-plug')

" Languages
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'lervag/vimtex'
Plug 'jansenm/vim-cmake'

" Linter
Plug 'dense-analysis/ale'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm i -g tern' }
Plug 'zchee/deoplete-jedi', {'do': 'python3 -m pip install --user jedi'}
Plug 'zchee/deoplete-clang', {'do': 'sudo pacman -S clang llvm'}

" Comments
Plug 'scrooloose/nerdcommenter'

" Emmet
Plug 'mattn/emmet-vim'

" Autocomplete parenthesis
Plug 'chun-yang/auto-pairs'

" Vim UI
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'scrooloose/nerdtree'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'

call plug#end()

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === deoplete ===
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ]

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/lib/clang/'

call deoplete#custom#option('sources', {'_': ['ale']})
