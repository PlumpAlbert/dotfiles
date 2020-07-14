source $HOME/.config/nvim/autoload/plug.vim

call plug#begin('~/.cache/vim-plug')

Plug 'scrooloose/nerdtree'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc', {'for': ['javascript','javascript.jsx','typescript'], 'do': 'make install'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'valloric/youcompleteme', {'do': './install.py --clangd-completer --ts-completer' }
Plug 'prettier/vim-prettier', {'do': 'npm i'}
Plug 'jansenm/vim-cmake'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

call plug#end()

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1
" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" prettier
let g:prettier#exec_cmd_path = "/usr/bin/prettier --config ~/.prettierrc"
