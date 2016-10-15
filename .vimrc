set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=180
map <C-c> "+y
set nu
"highlight ColorColumn ctermbg=darkgray
set nocompatible              " be iMproved, required
filetype off                  " required
let g:clang_library_path ='/home/esoroush/Projects_Apps/YouCompleteMe/third_party/ycmd'
let g:clang_use_library=1
let g:clang_debug = 1
source $VIMRUNTIME/defaults.vim
source ~/.vim/plugin/clang_complete.vim
let g:GetLatestVimScripts_allowautoinstall=1
let g:clang_user_options = '-std=c++11'
if has('syntax') && has('eval')
  packadd matchit
endif

execute pathogen#infect()
call pathogen#helptags()
"autocmd vimenter * NERDTree
"set runtimepath^=~/.vim/bundle/ctrlp.vim
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>

