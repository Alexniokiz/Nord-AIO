


call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'arcticicestudio/nord-vim'

Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdtree'

Plug 'tpope/vim-commentary'

Plug 'codota/tabnine-vim'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'ryanoasis/vim-devicons'

Plug '907th/vim-auto-save'

call plug#end()

set encoding=UTF-8

colorscheme nord

let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave"]

:set tabstop=4
:set shiftwidth=4
:set expandtab

set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

let g:indent_guides_enable_on_vim_startup = 1
set background=dark
set ts=4 sw=4 et
let g:indent_guides_start_level = 3
let g:indent_guides_guide_size = 1

:set number relativenumber
:set mouse=a

map <C-o> :NERDTreeToggle<CR>
map <C-/> gcc

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>