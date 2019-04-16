"----------------------------"
"--------Global Config-------"
"----------------------------"

"syntax on

set nu

set noswapfile
set nobackup
set mouse=a

filetype on
set history=1000

set autoindent
set cindent
set smartindent

"set expandtab " space grid replace tab
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=4

"set linebreak
set showmatch

set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
"set fileformats=unix
"set encoding=prc
set encoding=utf-8

set hlsearch
set incsearch

set laststatus=2
set ruler
set cursorline
"set cursorcolumn

"no \n
set nowrap
set hidden

"set maplearder
let  mapleader = ","
map <silent> <leader>ee :!vim ~/.vimrc<cr>



"----------------------------"
"--------- vim-plug  --------"
"----------------------------"
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Let Vundle manage itself
"Plugin 'VundleVim/Vundle.vim'

"Plugin 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'

Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'

" Plugin 'pangloss/vim-javascript' " 语法高亮
" Plugin 'nathanaelkane/vim-indent-guides'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
"
" show symbol index 
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'

" jump between header file and c++ file
Plug 'vim-scripts/a.vim'
Plug 'justinmk/vim-dirvish'

" function,file search
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" code checkout
Plug 'w0rp/ale'

" function parameter prompt
Plug 'Shougo/echodoc.vim'

call plug#end()


" let javascript_enable_domhtmlcss = 1

let g:auto_save = 1

" echodoc.vim
set noshowmode
"set cmdheight=2

"----------------------------"
"--------   airline   -------"
"----------------------------"
let g:airline_theme = "dark"


let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '⭡'

let g:airline_section_warning = airline#section#create([''])

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#buffer_nr_show = 0
let g:airline#extensions#tabline#fnamemod = ':t'  " show just the filename
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <tab> :bn<cr>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab




"----------------------------"
"------ YouCompleteMe -------"
"----------------------------"
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_open_loclist_on_ycm_diags = 0 
let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_min_num_identifier_candidate_chars = 2
" 快捷键触发语义补全
"let g:ycm_key_invoke_completion = '<c-z>'

" 下面两行关闭预览函数窗口
let g:ycm_add_preview_to_completeopt = 0
set completeopt=menu,menuone

let g:ycm_semantic_triggers =  {
			\ 'c,c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
" 使用时，关闭语法检查
 let g:ycm_show_diagnostics_ui = 0

let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'errs:' 
let g:airline#extensions#ycm#warning_symbol = 'warns:' 

" 显式错误时的颜色
highlight Error ctermfg=7 ctermbg=5
highlight SpellBad ctermfg=7 ctermbg=5
highlight PMenu ctermfg=255 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black


"----------------------------"
"---------   ctags  ---------"
"----------------------------"
set tags=./.tags;,.tags

"----------------------------"
"------   gutentags   -------"
"----------------------------"
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
 let s:vim_tags = expand('~/.cache/tags')
 let g:gutentags_cache_dir = s:vim_tags
" " 配置 ctags 的参数
 let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
 let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
 let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" " 检测 ~/.cache/tags 不存在就新建
 if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
    endif



"----------------------------"
"----------   ale  ----------"
"----------------------------"
"let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
 
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''



"----------------------------"
"--------   leaderf   -------"
"----------------------------"
let g:Lf_ShortcutF = '<leader>,'
let g:Lf_ShortcutB = '<leader>b'
" noremap <c-n> :LeaderfMru<cr>
noremap <leader>f :LeaderfFunction!<cr>
" noremap <m-n> :LeaderfBuffer<cr>
" noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}




"----------------------------"
"--------   utilSnips-------"
"----------------------------"
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-c>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"





autocmd BufNewFile *.c exec ":call AddreadmeC()"
autocmd BufNewFile *.h,*.hpp,*.cpp,*.cc exec ":call AddreadmeCPP()"
autocmd BufNewFile *.js exec ":call AddReadMeJs()"

function AddreadmeC()
    call setline(1, " ///")
	call append(1, " /// @file    " .expand("%:t"))
	call append(2, " /// @author  lemon(haohb13@gmail.com)")
	call append(3, " /// @date    ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(4, " ///")
	call append(5, " ")
	call append(6, "#include <stdio.h>")
	call append(7, " ")
	call append(8, "int main(void)")
	call append(9, "{")
	call append(10, " ")
	call append(11, "}")
endf

function AddreadmeCPP()
    call setline(1, " ///")
	call append(1, " /// @file    " .expand("%:t"))
	call append(2, " /// @author  lemon(haohb13@gmail.com)")
	call append(3, " /// @date    ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(4, " ///")
	call append(5, " ")
	call append(6, "#include <iostream>")
	call append(7, "using std::cout;")
	call append(8, "using std::endl;")
	call append(9, " ")
	call append(10, "int main(void)")
	call append(11, "{")
	call append(12, " ")
	call append(13, "}")
endf

function AddReadMeJs()
    call setline(1, " ///")
	call append(1, " /// @file    " .expand("%:t"))
	call append(2, " /// @author  lemon(haohb13@gmail.com)")
	call append(3, " /// @date    ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(4, " ///")
	call append(5, " ")
endf

