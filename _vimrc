"==========================================
" Sections:
"       -> Initial Plugin 加载插件
"       -> HotKey Settings  自定义快捷键
"       -> General Settings 基础设置
"       -> Display Settings 展示/排版等界面格式设置
"       -> FileEncode Settings 文件编码设置
"       -> Others 其它配置
"       -> FileType Settings  针对文件类型的设置
"       -> Theme Settings  主题设置
"
"       -> 插件配置和具体设置在vimrc.bundles中
"       -> 快捷键自定义在vimrc.hotkey中
"==========================================

"==========================================
" Initial Plugin 加载插件
"==========================================

" 修改leader键
let mapleader = ','
let g:mapleader = ','

" 开启语法高亮
syntax on

" install bundles
if filereadable(expand("$VIM/_vimrc.bundles"))
  source $Vim/_vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
  source ~/.config/nvim/vimrc.bundles
endif

" ensure ftdetect et al work by including this after the bundle stuff
filetype plugin indent on

"==========================================
" HotKey Settings  自定义快捷键
"==========================================

" install bundles
if filereadable(expand("$VIM/_vimrc.hotkey"))
  source $Vim/_vimrc.hotkey
endif

"==========================================
" General Settings 基础设置
"==========================================

"加载mswin.vim格式
source $VIMRUNTIME/mswin.vim
behave mswin

" history存储容量
set history=1000

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile


" TODO: remove this, use gundo
" create undo file
" if has('persistent_undo')
  " " How many undos
  " set undolevels=1000
  " " number of lines to save for undo
  " set undoreload=10000
  " " So is persistent undo ...
  " "set undofile
  " set noundofile
  " " set undodir=/tmp/vimundo/
" endif

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" 突出显示当前列
"set cursorcolumn
" 突出显示当前行
set cursorline


" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
"set t_ti= t_te=


" 鼠标暂不启用, 键盘党....
"set mouse-=a
" 启用鼠标
set mouse=a
" Hide the mouse cursor while typing
" set mousehide


" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key

" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" 使回格键（backspace）正常处理indent, eol, start等
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=3

" set winwidth=79

"状态行显示的内容
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
"启动显示状态行(1),总是显示状态行(2)
set laststatus=2

" 总是显示状态行
set cmdheight=2

" 显示行号
set number
" 取消换行
set nowrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" 匹配括号高亮的时间
set matchtime=2

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\


" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop
" 在行和段开始处使用制表符
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================

set fenc=chinese
"Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)
set encoding=utf-8
set langmenu=zh_CN.UTF-8
" 设置打开文件的编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
"set termencoding = cp936
language messages zh_CN.utf-8
"设置中文帮助
set helplang=cn
"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double

set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B


"==========================================
" others 其它设置
"==========================================
" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"set completeopt=longest,menu
"代码补全
set completeopt=preview,longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"python补全
let g:pydiction_location = '$VIM/vimfiles/after/complete-dict'
let g:pydiction_menu_height = 20
let Tlist_Ctags_Cmd='E:\Programs\ctags58'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


"==========================================
" FileType Settings  文件类型设置
"==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>



" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


au FileType php setlocal dict+=$VIM/vimfiles/dict/php_funclist.dict
au FileType css setlocal dict+=$VIM/vimfiles/dict/css.dict
au FileType c setlocal dict+=$VIM/vimfiles/dict/c.dict
au FileType cpp setlocal dict+=$VIM/vimfiles/dict/cpp.dict
au FileType scale setlocal dict+=$VIM/vimfiles/dict/scale.dict
au FileType javascript setlocal dict+=$VIM/vimfiles/dict/javascript.dict
au FileType html setlocal dict+=$VIM/vimfiles/dict/javascript.dict
au FileType html setlocal dict+=$VIM/vimfiles/dict/css.dict

"markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript

"graphviz
au BufRead,BufNewFile *.{gv,dot}   set filetype=graphviz


"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1,"\#!/bin/bash")
		call append(line("."), "")

        elseif &filetype == 'python'
                call setline(1,"#!/usr/bin/env python")
                call append(line("."),"# coding=utf-8")
	        call append(line(".")+1, "")

        elseif &filetype == 'ruby'
                call setline(1,"#!/usr/bin/env ruby")
                call append(line("."),"# encoding: utf-8")
	        call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")

        else
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author: ")
		call append(line(".")+2, "	> Mail: ")
		call append(line(".")+3, "	> Created Time: ".strftime("%c"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
	endif

	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
endfunc
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G


" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif


"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Consolas:h12:cANSI:qDRAFT
    if has("gui_gtk2")   "GTK2
        set guifont=Consolas:h12:cANSI:qDRAFT
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif
"------------------------------------------
"guioptions参数如下：
"------------------------------------------
"e     'showtabline'要求时,加入标签页.如果没有'e',可能使用非GUI标签页行.
"g     灰色菜单栏: 使得不活动的菜单栏变灰.如果没有包含'g',不活动的菜单栏完全不显示.
"m     使用菜单栏
"r     右边的滚动条总是存在
"L     如有垂直分割的窗口,左边的滚动条总是存在.
"t     包含可撕下的菜单项. 目前只用于 WIn32, GTK+,Motif 1.2 GUI. .
"T     包含工具栏.目前只用于 WIn32, GTK+,Motif, Phton和 Athena GUI.
"l     左边的滚动条总是存在.
"L     如有垂直分割的窗口,左边的滚动条总是存在.
"b     底部(水平)滚动条总是存在.它的大小取决于最长的可见行
"h     限制水平滚动条的大小为光标所在行的长度,以减少计算量.
"------------------------------------------


" theme主题
set background=dark
set t_Co=256

colorscheme solarized
" colorscheme molokai


" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
