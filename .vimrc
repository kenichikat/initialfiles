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

" manage plugins with neobundle.
let bundle_dir=vim_dir.'/bundle'
if !isdirectory(bundle_dir)
    call mkdir(bundle_dir)
    call system('git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim')
endif

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Plugins.
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc',{'build' : {'mac' : 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}
let g:quickrun_config={'_': {'split': ''}}
set splitbelow
NeoBundleCheck
call neobundle#end()


filetype plugin indent on

