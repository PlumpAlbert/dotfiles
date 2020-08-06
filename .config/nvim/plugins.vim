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
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'lervag/vimtex'
Plug 'jansenm/vim-cmake'
Plug 'mattn/emmet-vim'

" Linter
Plug 'dense-analysis/ale'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'theoldmoon0602/coc-plug'

" Comments
Plug 'scrooloose/nerdcommenter'

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

call coc_plug#begin()
  CocPlug 'coc-json'
  CocPlug 'coc-tsserver'
  CocPlug 'coc-html'
  CocPlug 'coc-css'
  CocPlug 'coc-sh'
  CocPlug 'coc-vimtex'
call coc_plug#end()

" JS
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" COC.NVIM
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
