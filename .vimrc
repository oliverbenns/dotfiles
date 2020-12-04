set encoding=utf-8

" Display
syntax on
set number

" Search
" case-insensitive searching
set ignorecase
" If capital letter is used, switch to case-sensitive search
set smartcase

" Disable backups
set nobackup
set nowritebackup
set noswapfile

" https://github.com/junegunn/fzf/blob/master/README-VIM.md
set rtp+=/usr/local/opt/fzf

" https://github.com/fatih/vim-go
filetype plugin indent on

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Javascript/Typescript/Jsx/Tsx ...yeah :/
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Fuzzy file search. Enables file search and contents search (with silver
" surfer)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Auto detect indentation. Useful if opening projects from various sources
" it might be better to just stick to editorconfig 
Plug 'tpope/vim-sleuth'

" Git(hub) features. Really useful for :Gbrowse and :Gblame
" Otherwise I stick with Git cli
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
 
" Initialize plugin system
call plug#end()

colorscheme molokai

let g:coc_global_extensions = [ 'coc-tsserver' ]

" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim#highlighting-for-large-files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

