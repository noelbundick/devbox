" vimrc ideas
" https://dougblack.io/words/a-good-vimrc.html

" vim-plug configuration
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" reminder - call :PlugInstall to install plugins!

" custom vim config
set number              " show line numbers

set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]

set hlsearch            " highlight searches
" reminder - disable highlight with :noh

set tabstop=2           " number of spaces per visual tab
set softtabstop=2       " number of spaces per tab when editing
set shiftwidth=2        " number of spaces to indent with <<, >>, and automatic indentation
set expandtab           " use spaces over tabs
filetype indent on      " load filetype-specific indent files

set lazyredraw          " redraw only when needed

set foldenable          " enable code folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" reminder - open/close folds with za

set mouse=a             " enable the mouse

" set some file types to 2 space indent
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType zsh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set splitbelow          " open new :sp/:split panes below
set splitright          " open new :vsp/:vsplit panes to the right
" reminder - navigate panes with Ctrl+W, h/j/k/l

" auto-insert pairing braces/brackets/etc when creating a block
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko

" --- altercation/vim-colors/solarized ---
colorscheme solarized   " use solarized color scheme
set background=dark     " use solarized dark

" --- vim-airline/vim-airline ---
set laststatus=2        " always show statusbar

" use powerline fonts
let g:airline_powerline_fonts=1

" show PASTE if in paste mode
let g:airline_detect_paste=1

" show airline for tabs too
let g:airline#extensions#tabline#enabled=1

" use the solarized theme for the airline status bar
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

