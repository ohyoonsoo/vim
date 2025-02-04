syntax on
set autoindent
set smartindent
set cindent
set shiftwidth=2
set tabstop=2
set nobackup
set nowrapscan
set number

" settings for lightline plugin
set laststatus=2
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'one',
	\ }
call plug#begin('~/.vim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
call plug#end()

" settings for codedark plugin
set t_Co=256
set t_ut=
colorscheme codedark

" settings for ctags
set tags=./tags,tags;$HOME

" settings for cscope
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction

autocmd VimEnter * call LoadCscope()
