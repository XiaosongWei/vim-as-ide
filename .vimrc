" File: .vimrc
" Author: Xiaosong Wei xiaosong.wei@gmail.com
"

" Gotta be first
set nocompatible

" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
"Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'vim-scripts/a.vim'
"Plugin 'derekwyatt/vim-fswitch'

Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/LeaderF'
Plugin 'scrooloose/nerdcommenter'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
"Plugin 'jez/vim-c0'
"Plugin 'jez/vim-ispc'
"Plugin 'kchmck/vim-coffee-script'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
"Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
"Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
"Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()

" 开启文件类型侦测
filetype on

" Load plugin depends on file type
filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
"set ignorecase

set hlsearch

" vim 自身命令行模式智能补全
set wildmenu

syntax on

set mouse=a

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" vim 自身（非插件）快捷键

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" switch between buffers
nnoremap <C-b> :bn<CR>
nnoremap <C-S-b> :bp<CR>


" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4


" ----- 在插入模式下移动光标 -----
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" ----- 环境恢复 -----
" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"


" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
"colorscheme solarized


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_theme='solarized'

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \fl
nmap <silent> <leader>fl :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=32
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" Open/close tagbar with \tb
nmap <silent> <leader>tl :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- 多文档编辑 -----
" 显示/隐藏 MiniBufExplorer 窗口
" map <Leader>bl :MBEToggle<cr>

" buffer 切换快捷键
" map <C-Tab> :MBEbn<cr>
" map <C-S-Tab> :MBEbp<cr>


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings -----
" better man page support
"noremap K :SuperMan <cword><CR>

" ----- ctrlp settings -----
"<Leader>f搜索MRU文件
"nmap <Leader>f :CtrlPMRUFiles<CR>
"<Leader>b显示缓冲区文件，并可通过序号进行跳转
"nmap <Leader>b :CtrlPBuffer<CR>
"设置搜索时忽略的文件
"let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
"let g:ctrlp_max_height = 15
"let g:ctrlp_match_window_reversed = 0
"设置MRU最大条目数为500
"let g:ctrlp_mruf_max = 500
"let g:ctrlp_follow_symlinks = 1
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
"let g:ctrlp_by_filename = 1
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
"let g:ctrlp_regexp = 0
"自定义搜索列表的提示符
"let g:ctrlp_line_prefix = '♪ '


" ----- Valloric/YouCompleteMe settings -----
" 设置跳转到方法/函数定义的快捷键 
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR> 
" 触发补全快捷键 
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>'] 
let g:ycm_auto_trigger = 1 
" 最小自动触发补全的字符大小设置为 3 
let g:ycm_min_num_of_chars_for_completion = 3 
" YCM的previw窗口比较恼人，还是关闭比较好 
set completeopt-=preview
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" ----- cscope settings -----
if has("cscope")
    set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
    " check cscope for definition of a symbol before checking ctags:
    " set to 1 if you want the reverse search order.
    set csto=1

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add the database pointed to by environment variable
    elseif $CSCOPE_DB !=""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" ----- vm-fswitch settings -----
" *.cpp 和 *.h 间切换
"nmap <silent> <Leader>sw :FSHere<cr>
