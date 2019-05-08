" ------------------------------------------------------------
" plug
filetype off                      " required!
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " 触发时才加载
Plug 'majutsushi/tagbar',   { 'on':  'TagbarToggle' }   " tag list
Plug 'vim-airline/vim-airline'                          " 状态条
Plug 'vim-airline/vim-airline-themes'                   " 状态条皮肤

" Plug 'Raimondi/delimitMate'                             " 括号自动补齐
" Plug 'tpope/vim-surround'                               " 括号快捷操作
Plug 'Chiel92/vim-autoformat', {'on':'Autoformat'}      " 代码格式化
Plug 'davidhalter/jedi-vim',   { 'for': 'python' }      " python 补齐
Plug 'Yggdroot/indentLine'                              " tab 线
Plug 'sillybun/vim-repl'                                " 终端
Plug 'Lokaltog/vim-easymotion'                          " 快速跳转
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }       " 模糊查找
Plug 'dyng/ctrlsf.vim'                                  " 模糊查找
Plug 'bronson/vim-trailing-whitespace'                  " 前后空格显示告警色
Plug 'tpope/vim-fugitive'                               " git命令行: Gwrite, Gstat, Gread
Plug 'ludovicchabant/vim-gutentags', { 'for': ['cpp', 'c', 'cc'] }  " 自动后台更新ctags
Plug 'skywind3000/gutentags_plus', { 'for': ['cpp', 'c', 'cc'] }    " 自动切换gtags数据库
Plug 'skywind3000/vim-preview'         " 搜索栏预览
Plug 'junegunn/vim-easy-align'         " 代码快速对齐, leader-ea
Plug 'w0rp/ale'                        " 语法检查, need clang cppcheck pylint shellcheck golint
" Plug 'nvie/vim-togglemouse'            " 切换当前terminal和vim的鼠标选择方式，F12
" Plug 'Yggdroot/vim-mark'               " mark 辅助
" Plug 'terryma/vim-multiple-cursors'    " 多选
" Plug 'vim-scripts/Smart-Tabs'          " 自动进行tab2space转换
" Plug 'yi/QFixToggle'              " 切换可视的quickfix窗口
" Plug 'tmhedberg/SimpylFold', { 'for': 'python' }       " 智能折叠
Plug 'justinmk/vim-dirvish'              " 目录进退
Plug 'tpope/vim-unimpaired'              " 扩展快捷键
" 快速补全
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer --go-completer'}
Plug 'rdnetto/YCM-Generator',  { 'branch': 'stable'}
Plug 'Shougo/echodoc.vim'               "函数参数提示 ?

" 强化具体语言文件
Plug 'vim-scripts/c.vim', { 'for': ['cpp', 'c', 'cc'] }
Plug 'vim-scripts/a.vim', { 'for': ['cpp', 'c', 'cc'] }                " h,c 切换
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp', 'c', 'cc'] } " cpp 高亮关键词和标准库
Plug 'fatih/vim-go',   { 'for': 'go' }                " go

Plug 'mbbill/undotree'                  " 撤销树
Plug 'pbrisbin/vim-mkdir'               " 为buff自动创建不存在的目录
Plug 'scrooloose/nerdcommenter'         " commenter: \cc \cu

Plug 'mhinz/vim-signify'                " 修改比较

Plug 'crusoexia/vim-monokai'            " skin
Plug 'skywind3000/asyncrun.vim'         " 异步执行插件
call plug#end()

filetype plugin on " 载入文件类型插件
filetype indent on " 为特定文件类型再如相关缩进文件

" ------------------------------------------------------------
" common
"yum install -y global-ctags
"pip install pygments
" brew install global || yum install global-tags
" brew install --HEAD universal-ctags/universal-ctags/universal-ctags
set encoding=utf-8
set nu
syntax on

set showcmd    " 显示命令
set showmode   " 显示当前编辑模式
set cursorline " 高亮当前行
set shortmess=atI " 去掉乌干达
set noerrorbells  " 禁止响铃
set vb t_vb=

let mapleader = ","  " 把,设定为 leader key
set nocompatible     " 使用vim的键盘模式
set backspace=indent,eol,start " set backspace=2 "正常处理indent，eol,start
set confirm          " 处理未保存文件和只读文件时，弹出提示

" set mouse=a " 激活鼠标
" set selection=exclusive
" set selectmode=mouse,key
" set clipboard=unnamed

set iskeyword+=_,$,@,%,#,-  "带有如下单次不要被换行分割
set wildmenu                " 增强莫使用的命令自动完成操作
" set wildmode=longest,list,full " 配置规则

set helplang=cn             " 中文doc

set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set report=0                " 通过使用：commands命令，告诉那一行文件被改变过

" 删除行尾多余的空格
" nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
autocmd BufWritePre * :%s/\s\+$//e

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set laststatus=2        " 总是显示状态行
set formatoptions=tcrqn " 自动格式化
set autoindent          " 继承前一行的缩进方式，特别适用于多行注释
set nowrap              " 不要换行
set smartindent         " 为C程序提供自动缩进
set tabstop=4
set softtabstop=4       " 把连续空格视为tab
set shiftwidth=4
set expandtab           " 用space替代tab的输入
set wrap                " 折行

" set cindent " 使用C样式的缩进
" set cinkeys=0{,0},:,0#,!,!^F

set scrolloff=10        " 光标移动到buffer的顶部和底部时保持10行距离
" \w 水平切分窗口
" nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>w <C-w>n<C-w>k

" 使用C-[h/j/k/l]切换切分窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif

" colorscheme solarized
colorscheme monokai

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

" 折叠设置
set foldmethod=syntax " set foldmethod=indent
autocmd FileType c,cc,cxx,cpp,perl set foldmethod=syntax
autocmd FileType vim set foldmethod=marker
autocmd FileType python set foldmethod=indent
set foldlevelstart=99   "打开文件是默认不折叠代码
set foldlevel=99        "打开文件是默认不折叠代码
au BufWinLeave  * silent mkview  " 保存文件的折叠状态
"au BufWinEnter  * silent loadview
au BufRead * silent loadview    " 恢复文件的折叠状态
" 用空格来切换折叠状态"
nnoremap <space> za

" ------------------------------------------------------------
" ale
let g:ale_sign_column_always = 1 " 语法检查,保持侧边栏可见
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'csh': ['shell'],
  \   'zsh': ['shell'],
  \   'go': ['gofmt', 'golint'],
  \   'python': ['flake8', 'mypy', 'pylint'],
  \   'c': ['gcc', 'cppcheck'],
  \   'cpp': ['gcc', 'cppcheck'],
  \   'text': [],
  \}
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
nmap <silent> <C-k> <Plug>(ale_previous_wrap) " 定位错误
nmap <silent> <C-j> <Plug>(ale_next_wrap) " 定位错误

" ------------------------------------------------------------
"  nerdtree
nmap <F1> :NERDTreeToggle<CR>

" ------------------------------------------------------------
"  tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
" 开启tagbar
nmap <F3> :TagbarToggle<CR>

" ------------------------------------------------------------
" airline
let g:airline#extensions#tabline#enabled = 1 " vim-airline,当一个tab时，开启打开的文件的tab标签
let g:airline_theme='deus'                   "'aurora'

" ------------------------------------------------------------
" easy align
vmap <Leader>ea <Plug>(EasyAlign)
nmap <Leader>ea <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" ------------------------------------------------------------
" vim go
" noremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>  " cmake
" 重构
autocmd FileType go nmap <leader><F6> :GoRename<CR>
" callers
autocmd FileType go nmap <leader><F5> :GoCallers<CR>
" callers
autocmd FileType go nmap <leader><F4> :GoCallees<CR>

autocmd FileType go nmap gs :GoDefStack<CR>
autocmd FileType go nmap gi :GoImports<CR>
autocmd FileType go nmap gb :GoBuild<CR>

" go 高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ------------------------------------------------------------
" nerdcomment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDCreateDefaultMappings=1
" let g:NERDCompactSexyComs = 1
" let g:NERDDefaultAlign = 'left'
" let g:NERDAltDelims_java = 1
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
" let g:NERDTrimTrailingWhitespace = 1

" ------------------------------------------------------------
" 自动格式化查询
" vim-autoformat
" au BufWrite * :Autoformat
noremap <F4> :Autoformat<CR>
let g:formatdef_harttle = '"astyle --style=linux --pad-oper"' " 定一个一个叫harrttle的formater
let g:formatters_cpp = ['harttle']
let g:formatters_java = ['harttle']
let g:formatters_python = ['autopep8']
let g:autmformat_verbosemode=1 " 显示自动格式化插件的详细信息
" pip install --user yapf
" let g:formatter_yapf_style = 'pep8'
" let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"

" ------------------------------------------------------------
" undotree 撤销树
nnoremap <F6> :UndotreeToggle<cr>
set undodir=~/.undodir/
set undofile

" ------------------------------------------------------------
" echo doc
set noshowmode

" ------------------------------------------------------------
" vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_show_text = 1

" ------------------------------------------------------------
" jedi-vim, python
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

" ------------------------------------------------------------
" repl
" 在Normal模式下：按`<leader>w`，光标所在行（包括一个最后的回车）便会输入到REPL中。
" 在Visual模式下：按`<leader>w`，对应的所有行（包括最后的回车）便会输入到REPL中。
" 在REPL窗口查看历史消息，按下：`<C-w>N`，便可以进入terminal-normal模式。

nnoremap <leader><leader>r :REPLToggle<Cr>
" nnoremap <leader><leader>r :terminal<Cr>
" let g:repl_width =
let g:repl_height = 20  "窗口高度
let g:sendtorepl_invoke_key = "<leader><leader>W"   "传送代码快捷键
let g:repl_position = 0                             "0表示出现在下方，1表示出现在上方，2在左边，3在右边
let g:repl_stayatrepl_when_open = 0                 "打开REPL时是回到原文件（1）还是停留在REPL窗口中（0）
let g:repl_program = {
            \   "python": "python",
            \   "default": "zsh"
            \   }

let g:repl_exit_commands = {
            \   "python": "quit()",
            \   "bash": "exit",
            \   "zsh": "exit",
            \   "default": "exit",
            \   }

" ------------------------------------------------------------
" ayncrun 异步执行
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
let g:asyncrun_open = 6 " 自动打开 quickfix window ，高度为 6
let g:asyncrun_bell = 0 " 任务结束时候响铃提醒
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" ------------------------------------------------------------
" aync + cpp
" 下面三行分别设置了运行、编译、调试的快捷键，n表示该快捷键在normal模式下起作用； nore表示该定义不会递归地传递；<CR>是回车（carriage return），!表示执行Shell命令。
autocmd FileType c,cpp,h,cxx,cc nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
autocmd FileType c,cpp,h,cxx,cc nnoremap nnoremap <silent> <F7> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>    " make
" noremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>  " cmake
" nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr> " make run
" nnoremap <C-F5> <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb /tmp/a.out<CR>
" nnoremap <F5>   <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>
" nnoremap <F7>   <Esc>:w<CR>:!g++ -std=c++11 %<CR>

" ------------------------------------------------------------
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

" ------------------------------------------------------------
" CtrlSF
"sumblime，vs式的预览这两种模式也可以按M随时切换。
let g:ctrlsf_default_view_mode = 'compact'
nnoremap <leader>a :CtrlSF<Space>
let g:ctrlsf_ignore_dir=['tags', '.git']
" let g:ctrlsf_ackprg='ag'  据说ag效率更高一点
let g:ctrlsf_default_view_mode='compact'
let g:ctrlsf_auto_close=0           " 不自动关闭，搜索字符串不像搜标签，经常需要点开看看
let g:ctrlsf_case_sensitive='no'    " 大小写不敏感
let g:ctrlsf_default_root='cwd'     " 设置在当前工作目录下搜索，和nerdtree一致。

" ------------------------------------------------------------
" gutentags
let g:gutentags_define_advanced_commands = 1 " debug
set tags=./.tags;,.tags
let $GTAGSLABEL = 'native-pygments' " native, pygments, native-pygments
let $GTAGSCONF = '/usr/local/etc/gtags.conf'

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.git','.root','.svn','.hg','.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为,避免多个项目数据库相互干扰,使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 0
"let g:gutentags_define_advanced_commands = 1
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_plus_nomap = 1 " 禁用默认keymap, 和nerdcommenter冲突了
" Find symbol (reference) under cursor
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
" Find symbol definition under cursor
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
" Functions called by this function
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
" Functions calling this function
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" Find text string under cursor
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
" Find egrep pattern under cursor
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" Find file name under cursor
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" Find files #including the file name under cursor
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
" Find places where current symbol is assigned
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>

" ------------------------------------------------------------
" vim-preview
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

" ------------------------------------------------------------
" cpp-enhanced-highlight
" 高亮类，成员函数，标准库和模板
let g:cpp_class_scope_highlight = 1         " 类范围的突出显示
let g:cpp_member_variable_highlight = 1     " 类成员的突出显示
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1 " 突出模板函数
"文件较大时使用下面的设置高亮模板速度较快，但会有一些小错误
"let g:cpp_experimental_template_highlight = 1

" ------------------------------------------------------------
" let g:Lf_ShortcutF = '<c-p>'
" let g:Lf_ShortcutB = '<m-n>'
noremap <Leader>ff :LeaderfFunction<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>fl :LeaderfLine<cr>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_NormalMap = {
            \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
            \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
            \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
            \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
            \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
            \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
            \ }

" ------------------------------------------------------------
"  ycm
"关闭自动弹出的窗口
"set completeopt=menu,menuone
let g:ycm_global_ycm_extra_conf= '~/.vim/config/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-y>'
set completeopt=menu,menuone
" 使用 Ctrl+y 主动触发语义补全
noremap <c-y> <NOP>
" 修改补全列表配色
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "js":1,
            \ "cpp":1,
            \ "cxx":1,
            \ "go":1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ }

let g:ycm_filetype_blacklist = {
            \ 'markdown' : 1,
            \ 'text' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \}

" ------------------------------------------------------------
"" YouCompleteMe
"" let g:ycm_keep_logfiles = 1
" let g:ycm_log_level = 'debug'

"let g:SuperTabClosePreviewOnPopupClose = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/ycm_extra_conf.py'
"
"
"let g:ycm_complete_in_comments=1  " 补全功能在注释中同样有效
"let g:ycm_confirm_extra_conf=0   " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_collect_identifiers_from_tags_files=1   " 开启 YCM 基于标签引擎
"set tags+=/data/misc/software/misc./vim/stdcpp.tags   " 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
"" inoremap <leader>; <C-x><C-o>  " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"" set completeopt-=preview   " 补全内容不以分割子窗口形式出现，只显示补全列表
"let g:ycm_min_num_of_chars_for_completion=1  " 从第一个键入字符就开始罗列匹配项
"let g:ycm_cache_omnifunc=0   " 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax=1   " 语法关键字补全
"" let g:ycm_key_invoke_completion = '<M-;>'   " 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
"" 设置转到定义处的快捷键为ALT + G
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration<C-R>=expand("<cword>")<CR><CR>"


" ------------------------------------------------------------
" Plug 'YankRing.vim'                    " yank kill
" YankRing
" let g:yankring_history_dir = $HOME.'/.vim/' "将yankring的历史文件夹移到~/.vim
" let g:yankring_history_file = '.yankring_history' "修改历史文件名
" let g:yankring_replace_n_pkey = '<Leader>m' "<leader>m选择上一个复制的文本
" let g:yankring_replace_n_pkey = '<Leader>n' "<leader>n选择下一个复制的文本
"<leader>y显示yankring中的内容
" nmap <Leader>y :YRShow<CR>

" ------------------------------------------------------------
" quickfix
" nmap <F2> :QFix<CR>

"
" ------------------------------------------------------------
" multiple-cursors
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-m>' " ctrl+m 选中一个
"let g:multi_cursor_prev_key='<C-p>' " ctrl+p 放弃一个, 回到上一个
"let g:multi_cursor_skip_key='<C-x>' " ctrl+x 跳过当前选中, 选中下一个
"let g:multi_cursor_quit_key='<Esc>' " esc    退出
"" let g:multi_cursor_start_word_key      = '<C-n>'
"" let g:multi_cursor_select_all_word_key = '<A-n>'
"" let g:multi_cursor_start_key           = 'g<C-n>'
"" let g:multi_cursor_select_all_key      = 'g<A-n>'
"" let g:multi_cursor_next_key            = '<C-n>'

" ------------------------------------------------------------
" vim-mark
" nmap <Leader>M <Plug>MarkAllClear
" nmap <leader>n <Plug>MarkSearchOrCurNext
" nmap <leader>N <Plug>MarkSearchOrCurPrev
" nmap <leader>* <Plug>MarkSearchGroupNext
" nmap <leader>? <Plug>MarkSearchGroupPrev
"" <leader>m " mark
"" <leader>r " mark input string
"" <leader>* " jump next mark
"" <leader># " jump prev mark
"" <leader>/ " jump next mark
"" <leader>? " jump next mark
"":MarkClear 清除所有标签
"":Marks 列出所有标签
"":MarkSave(set vimfino+=!) MarkLoad
"" nmap <Leader>m <Plug>MarkToggle
