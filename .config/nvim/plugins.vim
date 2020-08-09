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
Plug 'ianks/vim-tsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'lervag/vimtex'
Plug 'jansenm/vim-cmake'
Plug 'mattn/emmet-vim'

" Linter
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
source $HOME/.config/nvim/neoformat/javascript.vim

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-clangd',
      \ 'coc-cmake',
      \ 'coc-highlight',
      \ 'coc-jedi',
      \ 'coc-vimtex'
      \]


" Comments
Plug 'scrooloose/nerdcommenter'

" Autocomplete parenthesis
Plug 'chun-yang/auto-pairs'

" Vim UI
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'scrooloose/nerdtree'
Plug 'pgavlin/pulumi.vim'
Plug 'flrnprz/plastic.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'

call plug#end()

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
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
