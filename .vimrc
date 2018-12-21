set showcmd " 显示命令
set showmode " 显示当前编辑模式
" set cursorcolumn " 高亮当前列
set cursorline " 高亮当前行
set shortmess=atI " 去掉乌干达
set noerrorbells " 禁止响铃
set vb t_vb=
" set mouse=a " 激活鼠标
" set selection=exclusive
" set selectmode=mouse,key
" set clipboard=unnamed

set iskeyword+=_,$,@,%,#,- "带有如下单次不要被换行分割
set linespace=10 " 字符间插入的像素数
set wildmenu " 增强莫使用的命令自动完成操作

set helplang=cn

set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set report=0 " 通过使用：commands命令，告诉那一行文件被改变过

" set cmdheight=2 " 命令行的高度，默认1
" set backspace=2 "正常处理indent，eol,start

" set whichwrap+=<,>,h,l " 允许backspace和光标跨越行边界
" 在行和段开始处使用制表符
" set smarttab

" remove all trailing spaces in the current file
" nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"
" autocmd BufWritePre * :%s/\s\+$//e

" quickly open up my ~/.vimrc file in a vertically split window so I can add new things to it on the fly.
" nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" 总是显示状态行
set laststatus=2

set guifont=YaHei\ Consolas\ HyBrid:h14 " 字体

set encoding=utf-8
set number
syntax on

set scrolloff=10 " 光标移动到buffer的顶部和底部时保持3行距离
" set novisualbell " 不要闪烁

colorscheme torte
set formatoptions=tcrqn " 自动格式化
set autoindent " 继承前一行的缩进方式，特别适用于多行注释
set nowrap " 不要换行

set smartindent " 为C程序提供自动缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4

set cindent " 使用C样式的缩进
"set cinkeys=0{,0},:,0#,!,!^F

" 不要用空格代替制表符
" set expandtab

let mapleader = ","  " 把 \ 设定为 leader key,  use \ as the lead key
set nocompatible               " 不是用vi，而是使用vim的键盘模式
set backspace=indent,eol,start
set confirm " 处理未保存文件和只读文件时，弹出提示
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim

" \w 水平切分窗口
" nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>w <C-w>n<C-w>k

" 使用C-[h/j/k/l]切换切分窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" 设置tab操作的快捷键，绑定:tabnew到<leader>t，绑定:tabn, :tabp到<leader>n, "<leader>p
map <leader><leader>t :tabnew<CR>
map <leader><leader>n :tabn<CR>
map <leader><leader>p :tabp<CR>

map <leader>b :bn<CR>
map <leader>B :bp<CR>

map <leader><space> :nohl<CR>

inoremap jj <ESC>

map <leader>rr :reg<CR>
" map <leader>ap "0p<CR>
" map <leader>bp "1p<CR>
" map <leader>cp "2p<CR>
" map <leader>dp "3p<CR>
" map <leader>ep "4p<CR>


" 禁用scratch preview
" set completeopt-=preview

" 用空格键来开关折叠
" set nofoldenable
" set foldmethod=marker
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go' " go
Plugin 'Valloric/YouCompleteMe' "自动补齐

Plugin 'The-NERD-tree' " 文件管理器

" Plugin 'mileszs/ack.vim' " ack

Plugin 'vim-airline/vim-airline' " 状态条
Plugin 'vim-airline/vim-airline-themes'

" Plugin 'ctrlp.vim' " regexp支持文件，buffer，mru tag查找

Plugin 'tagbar' " Display tags of curr file order by scope-NERD-tree'

Plugin 'yi/QFixToggle' " 切换可视的quickfix窗口

Plugin 'scrooloose/nerdcommenter'   " commenter: \cc \cu

Plugin 'Raimondi/delimitMate'		 " 括号自动补齐

Plugin 'Chiel92/vim-autoformat'      " 代码格式化

Plugin 'tmhedberg/SimpylFold'   " 智能折叠

Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Bundle 'davidhalter/jedi-vim'

Plugin 'Yggdroot/indentLine'

Plugin 'sillybun/vim-repl'

Plugin 'Lokaltog/vim-easymotion'

Plugin 'Yggdroot/LeaderF'

Plugin 'Yggdroot/vim-mark'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " go实现模糊查找工具
call vundle#end()

filetype plugin on " 载入文件类型插件
filetype indent on " 为特定文件类型再如相关缩进文件

" 搜索和匹配
nnoremap / /\v
vnoremap / /\v
set ignorecase " 在搜索的时候忽略大小写
set smartcase  "If you search for an all-lowercase string your search will be case-insensitive, but if one or more characters is uppercase the search will be case-sensitive.
set gdefault   "applies substitutions globally on lines. For example, instead of :%s/foo/bar/g you just type :%s/foo/bar/.
set incsearch " 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set showmatch " 高亮显示匹配的括号
set matchtime=5 " 匹配括号高亮的时间（单位是十分之一秒）
set hlsearch " 高亮被搜索的句子（phrases）

" vim go
" 重构
nmap <leader><F6> :GoRename<CR>
" callers
nmap <leader><F5> :GoCallers<CR>
" callers
nmap <leader><F4> :GoCallees<CR>

nmap gs :GoDefStack<CR>
nmap gi :GoImports<CR>
nmap gb :GoBuild<CR>

" YouCompleteMe
" let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

let g:SuperTabClosePreviewOnPopupClose = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/ycm_extra_conf.py'


let g:ycm_complete_in_comments=1  " 补全功能在注释中同样有效
let g:ycm_confirm_extra_conf=0   " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=1   " 开启 YCM 基于标签引擎
set tags+=/data/misc/software/misc./vim/stdcpp.tags   " 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
" inoremap <leader>; <C-x><C-o>  " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
" set completeopt-=preview   " 补全内容不以分割子窗口形式出现，只显示补全列表
let g:ycm_min_num_of_chars_for_completion=1  " 从第一个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0   " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1   " 语法关键字补全
" let g:ycm_key_invoke_completion = '<M-;>'   " 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
" 设置转到定义处的快捷键为ALT + G
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration<C-R>=expand("<cword>")<CR><CR>"




"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
" let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags'
" 开启tagbar
nmap <F3> :TagbarToggle<CR>

" 用,a开启ack
" nnoremap <Leader>a :Ack!<Space>

" vim-airline,当一个tab时，开启打开的文件的tab标签
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='aurora'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep='>'
let g:airline_right_sep='<'

" GO 高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" au FocusLost * :wa "save on losing focus

" ctrlP 忽略的文件
" let g:ctrlp_map = '<c-p>' " 快捷键
" let g:ctrlp_map = '<leader>p' " 快捷键
" let g:ctrlp_cmd = 'CtrlPMixed' " 默认使用的指令
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$','file': '\v\.(exe|so|dll)$','link': 'SOME_BAD_SYMBOLIC_LINKS', }
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " 忽略.gitignore里的文件


" 用 F2 toggle quickfix window
nmap <F1> :NERDTreeToggle<CR>

" 用 F2 toggle quickfix window
nmap <F2> :QFix<CR>


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" 自动格式化查询
" au BufWrite * :Autoformat
noremap <F4> :Autoformat<CR>
let g:formatdef_harttle = '"astyle --style=linux --pad-oper"' " 定一个一个叫harrttle的formater
let g:formatters_cpp = ['harttle']
let g:formatters_java = ['harttle']
" pip install --user yapf
" let g:formatter_yapf_style = 'pep8'
" let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['autopep8']
let g:autmformat_verbosemode=1 " 显示自动格式化插件的详细信息


" 下面三行分别设置了运行、编译、调试的快捷键，n表示该快捷键在normal模式下起作用； nore表示该定义不会递归地传递；<CR>是回车（carriage return），!表示执行Shell命令。
nnoremap <F5>   <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>
nnoremap <F7>   <Esc>:w<CR>:!g++ -std=c++11 %<CR>
nnoremap <C-F5> <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb /tmp/a.out<CR>

" 折叠设置
set foldmethod=syntax " set foldmethod=indent
set foldlevelstart=99 "打开文件是默认不折叠代码
au BufWinLeave * silent mkview  " 保存文件的折叠状态
au BufRead * silent loadview    " 恢复文件的折叠状态
nnoremap <space> za             " 用空格来切换折叠状态"

" jedi-vim

let g:jedi#show_call_signatures = "2"

" let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_command = "gd"
" let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader><leader><leader>r"

" repl
" 在Normal模式下：按`<leader>w`，光标所在行（包括一个最后的回车）便会输入到REPL中。
" 在Visual模式下：按`<leader>w`，对应的所有行（包括最后的回车）便会输入到REPL中。
" 在REPL窗口查看历史消息，按下：`<C-w>N`，便可以进入terminal-normal模式。

nnoremap <leader><leader>r :REPLToggle<Cr>
" nnoremap <leader><leader>r :terminal<Cr>
" let g:repl_width = 
let g:repl_height = 20	"窗口高度
let g:sendtorepl_invoke_key = "<leader><leader>W" "传送代码快捷键
let g:repl_position = 0 "0表示出现在下方，1表示出现在上方，2在左边，3在右边
let g:repl_stayatrepl_when_open = 0  "打开REPL时是回到原文件（1）还是停留在REPL窗口中（0）
let g:repl_program = {
			\	"python": "python",
			\	"default": "zsh"
			\	}

let g:repl_exit_commands = {
			\	"python": "quit()",
			\	"bash": "exit",
			\	"zsh": "exit",
			\	"default": "exit",
			\	}


" vim-easymotion, 快速跳转
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" <leader><leader> w,b forward back
" <leader><leader> s search 
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" map <Leader><leader>. <Plug>(easymotion-repeat)

" CtrlSF
"sumblime，vs式的预览这两种模式也可以按M随时切换。
let g:ctrlsf_default_view_mode = 'compact'
nnoremap <leader>a :CtrlSF<Space>
let g:ctrlsf_ignore_dir=['tags', '.git']
" let g:ctrlsf_ackprg='ag'  据说ag效率更高一点
let g:ctrlsf_default_view_mode='compact'
let g:ctrlsf_auto_close=0 " 设置不自动关闭，搜索字符串不像搜标签，经常需要点开看看。
let g:ctrlsf_case_sensitive='no' "大小写不敏感，为了查询更快速，默认设成大小写不敏感搜索。
let g:ctrlsf_default_root='cwd' " 设置在当前工作目录下搜索，和nerdtree一致。

" multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>' " ctrl+m 选中一个
let g:multi_cursor_prev_key='<C-p>' " ctrl+p 放弃一个, 回到上一个
let g:multi_cursor_skip_key='<C-x>' " ctrl+x 跳过当前选中, 选中下一个
let g:multi_cursor_quit_key='<Esc>' " esc    退出
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'

" vim-mark
" <leader>m " mark
" <leader>r " mark input string
" <leader>* " jump next mark 
" <leader># " jump prev mark
" <leader>/ " jump next mark
" <leader>? " jump next mark
":MarkClear 清除所有标签
":Marks 列出所有标签
":MarkSave(set vimfino+=!) MarkLoad
" nmap <Leader>m <Plug>MarkToggle
nmap <Leader>M <Plug>MarkAllClear
nmap <leader>n <Plug>MarkSearchOrCurNext
nmap <leader>N <Plug>MarkSearchOrCurPrev
nmap <leader>* <Plug>MarkSearchGroupNext
nmap <leader>? <Plug>MarkSearchGroupPrev



"
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
" let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
"
"
"



