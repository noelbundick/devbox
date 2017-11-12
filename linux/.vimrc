" vim-plug configuration
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'altercation/vim-colors-solarized'

call plug#end()
" reminder - call :PlugInstall to install plugins!

" custom vim config
set number              " show line numbers

set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]

set hlsearch            " highlight searches
" reminder - disable highlight with :noh

set tabstop=4           " number of spaces per visual tab
set softtabstop=4       " number of spaces per tab when editing
set expandtab           " use spaces over tabs
filetype indent on      " load filetype-specific indent files

set lazyredraw          " redraw only when needed

set foldenable          " enable code folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" reminder - open/close folds with za

" Use solarized dark
set background=dark
colorscheme solarized

set mouse=a

" set yaml to 2 space indent
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


