set encoding=utf-8

" Display
syntax on
set number
colorscheme slate

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

