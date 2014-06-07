""""""" Display """""""
" always display status line
set laststatus=2
" use 256 colors
set t_Co=256
" display row number
set number
" style status line
let g:lightline = {
      \ 'colorscheme': 'jellybeans'
      \ }
" diplay cursor line
set cursorline


""""""""" Tab """""""""
" tab space
set tabstop=2
" not use spaces
set noexpandtab


"--------- neobundle setting ---------
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" add plugins

filetype plugin on

NeoBundleCheck
" --------------------------------------

" -------------- bundle ----------------
" light line
NeoBundle 'itchyny/lightline.vim'
" NERD tree
NeoBundle 'scrooloose/nerdtree'
" jedi-vim (for python)
NeoBundle 'davidhalter/jedi-vim'

