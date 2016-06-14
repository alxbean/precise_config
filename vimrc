"base config
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>kA<CR>
""inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    
set wildmode=list,full
set wildignorecase

set relativenumber

set nocompatible
set number

set laststatus=1
        
set autoread

set autowrite

set foldenable
set foldmethod=marker
    
set cursorline

set ruler

set showcmd
    
set history=1000

set nobackup
set noswapfile

set showmatch

"set autoindent
set cindent

syntax enable
syntax on

set t_Co=8

set noignorecase

set backspace=indent,eol,start

"set mouse=a

set tabstop=4

set shiftwidth=4

set smarttab
set softtabstop=4

set expandtab

set hlsearch
set magic

set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latinl

"C,C++ F5 CompileRunGcc
map <F5> : call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

"C,C++ DEBUG
map <F6> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


filetype plugin indent on

"new file title cpp,sh,java...
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: shuaixiang")
        call append(line(".")+2, "\# mail: shuaixiang@yuewen.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: shuaixiang")
        call append(line(".")+2, "    > Mail: shuaixiang@yuewen.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
         call append(line(".")+6, "#include <stdio.h>")
         call append(line(".")+7, "")
    endif
    
    autocmd BufNewFile * normal G
endfunc

"vundle config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'taglist.vim'
Bundle 'Syntastic'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bufexplorer.zip'
Bundle 'terryma/vim-multiple-cursors'

"taglist
let Tlist_Compact_Format=1
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Auto_Highlight_tag=1
let Tlist_Auto_Update=1
let Tlist_WinWidth=30
let Tlist_Exit_OnlyWindow=1 
let Tlist_Use_SingClick=1
nnoremap <silent> <F8> :TlistToggle<CR>

"NERD_Tree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHightCursorline=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
let NERDTreeMinimalUI=1
nnoremap <silent> <F4> :NERDTreeToggle<CR>

"YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'  
let g:ycm_collect_identifiers_from_tags_files = 1  
let g:ycm_seed_identifiers_with_syntax = 1  
let g:ycm_confirm_extra_conf = 0 

"Syntastic
let g:syntastic_check_on_open = 1  
let g:syntastic_cpp_include_dirs = ['/usr/include/']  
let g:syntastic_cpp_remove_include_errors = 1  
let g:syntastic_cpp_check_header = 1  
let g:syntastic_cpp_compiler = 'clang++'  
"set error or warning signs  
let g:syntastic_error_symbol = 'x'  
let g:syntastic_warning_symbol = '!'  
"whether to show balloons  
let g:syntastic_enable_balloons = 1  

"BufExplorer
let g:bufExplorerDefaultHelp=0 "Do not show default help.
let g:bufExplorerShowRelativePath=1 "Show relative paths.
let g:bufExplorerSortBy='mru' "Sort by most recently used.

"vim-multiple-cursors

"vim-colors-solarized
set background=dark
"colorscheme solarized
