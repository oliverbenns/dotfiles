set encoding=utf-8

" Display
syntax on
set number

" Highlight search items
set hlsearch
" https://vi.stackexchange.com/questions/8741/how-to-automatically-turn-off-hlsearch-after-im-done-searching
nnoremap <esc><esc> :silent! nohls<cr>

" More natural window splitting
set splitright
set splitbelow

" Allow copy + paste across vim + sys clipboard
" https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set clipboard^=unnamed,unnamedplus

" Search
" case-insensitive searching
set ignorecase
" If capital letter is used, switch to case-sensitive search
set smartcase

" Disable backups
set nobackup
set nowritebackup
set noswapfile

" Let me backspace
set backspace=indent,eol,start

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

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim#highlighting-for-large-files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Set to Molokai colors
let $FZF_DEFAULT_OPTS="--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81 --color info:144,prompt:161,spinner:135,pointer:135,marker:118"
" Always show hidden files, ignore .git and respect .gitignore
let $FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -g \"\""

" File/contents search mappings
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-h> :History<CR>
nnoremap <silent> <S-f> :Ag<CR>

" Go
let g:go_fmt_command = "goimports"

" Auto reload any changes to file outside of vim
set autoread

" Override config specific to machine
if filereadable(expand("~/.vimrc_custom"))
  source ~/.vimrc_custom
endif


command PrettyJson %!python -m json.tool

" https://github.com/neoclide/coc-tsserver/issues/14#issuecomment-548045568
" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" @TODO: Get these working - leader does not seem to be working correctly (r
" goes to replace char mode)
nmap <leader> do <Plug>(coc-codeaction)
nmap <leader> rn <Plug>(coc-rename)
