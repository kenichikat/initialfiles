" disable vi compatibility.
set nocompatible

" prepare directory.
let vim_dir=expand('~/.vim')
let tmp_dir=vim_dir.'/tmp'

if !isdirectory(vim_dir) | call mkdir(vim_dir) | endif
if !isdirectory(tmp_dir) | call mkdir(tmp_dir) | endif
  
" path for auto generated files.
set backup
set backupdir=~/.vim/tmp
set swapfile
set directory=~/.vim/tmp

" view
syntax on
colorscheme industry
set cursorline
set number
set showmatch

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
autocmd BufNewFile,BufRead * match ZenkakuSpace /　/

" edit
set smartcase
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab

autocmd BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2
" same as default.
"autocmd BufNewFile,BufRead *.py  set nowrap tabstop=4 shiftwidth=4
"autocmd BufNewFile,BufRead *.php  set nowrap tabstop=4 shiftwidth=4

filetype plugin indent off