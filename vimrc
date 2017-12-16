set nocompatible
filetype off

filetype plugin indent on    " required
syntax enable

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp', '\.pyc$', '__pycache__']

map <C-n> :NERDTreeToggle<CR>

autocmd Filetype eruby setlocal ts=2 sw=2 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype sh setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set guifont=Menlo\ Regular:h10
set background=dark
set splitbelow
set splitright
set number
set ruler
set wildmode=longest,list
set wildmenu
set backspace=2

