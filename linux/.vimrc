" vimrc ideas
" https://dougblack.io/words/a-good-vimrc.html

" vim-plug configuration
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hashivim/vim-terraform'

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

" speed optimizations
set ttyfast             " indicate a fast terminal connection
set lazyredraw          " redraw only when needed

" hacks until until https://github.com/vim/vim/issues/2584 is fixed
" either one works for me
"set cursorline&         " disable cursorline
set re=1                " use old regex engine

set foldenable          " enable code folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" reminder - open/close folds with za

set mouse=a             " enable the mouse

" set some file types to 2 space indent
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType zsh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" reminder - use :sp and :vsp to create splits
" reminder - navigate splits with Ctrl+W, h/j/k/l
set splitbelow          " open new :sp/:split panes below
set splitright          " open new :vsp/:vsplit panes to the right

" use ctrl+h/j/k/l for split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" auto-insert pairing braces/brackets/etc when creating a block
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko

" --- altercation/vim-colors/solarized ---
silent! colorscheme solarized   " use solarized color scheme
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

" --- hashivim/vim-terraform ---
let g:terraform_align=1 " let vim-terraform handle indentation

" enable code folding using spacebar
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
