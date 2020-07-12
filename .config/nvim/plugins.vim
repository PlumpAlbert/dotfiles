source $HOME/.config/nvim/autoload/plug.vim

call plug#begin('~/.cache/vim-plug')

Plug 'scrooloose/nerdtree'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'valloric/youcompleteme', {'do': './install.py --clangd-completer --ts-completer' }

call plug#end()
