set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================

set rtp+=~/.vim/bundle/Vundle.vim       " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          	" Class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-fugitive'             " Cool git features in vim

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo

"---------------=== Languages support ===-------------

" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'lambdalisue/vim-python-virtualenv'

" --- JavaScript ---
Plugin 'pangloss/vim-javascript'	" Vastly improved Javascript indentation and syntax support in Vim
Plugin 'maksimr/vim-jsbeautify'         " Formated javascript files by js-beautify

" --- HTML ---
Plugin 'othree/html5.vim'		" HTML5 omnicomplete and sytnax
Plugin 'idanarye/breeze.vim'		" Html navigation like vim-easymotion, tag matching, tag highlighting and DOM navigation

" --- CSS ---
Plugin 'JulesWang/css.vim'		" CSS syntax file
Plugin 'groenewege/vim-less'		" Vim syntax for LESS (dynamic CSS)	

call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup
set ruler
set completeopt-=preview
set gcr=a:blinkon0

" ----- Vim Color Scheme and Font configuration -----

syntax on             " Code syntax highlight
set t_Co=256
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
colorscheme darkblue
"colorscheme desert
hi Comment ctermfg=Green
hi String ctermfg=DarkGreen
hi pythonPreCondit ctermfg=DarkGrey

tab sball
set switchbuf=useopen

"set termencoding=utf-8
set encoding=utf-8 
set incsearch 
set hlsearch         " highlight search results
set number           " Show line numbers
set scrolloff=5
set autoindent

set nobackup         " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile       " no swap files

" Tab Configuration
set smarttab
set tabstop=8

" In Ruby/Python/js/C/C++ highlight code if line longer than 80
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" ---- SnipMate -----
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" ------ Vim-Airline ------
set laststatus=2
let g:airline_theme='luna'
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#virtualenv#enabled=1


"=====================================================
" Python-mode settings
"=====================================================

" Turn off autocomplete  (jedi-vim used instead)
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0

" Docs
let g:pymode_doc=0
let g:pymode_doc_key='K'

" Code Lints
let g:pymode_lint=1
let g:pymode_lint_checker="pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" Code Validation on Save
let g:pymode_lint_write=1

" virtualenv Support
let g:pymode_virtualenv=1

" breakpoints Set up
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" Sytax highlight.
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

" Turn off autofolding
"let g:pymode_folding=0

" Turn off code execution
let g:pymode_run=0

"=====================================================
" User hotkeys
"=====================================================

" ----- TagBar -----
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus=0    

" ----- NerdTree -----
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

" ----- TaskList -----
map <F2> :TaskList<CR>    " Show Task List by F2

" ----- ConqueTerm -----
" Run Ipyhton by F5
nnoremap <F5> :ConqueTermSplit ipython<CR>
" Run Ipython in debug-mode by F6
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>

let g:ConqueTerm_StartMessages=0
let g:ConqueTerm_CloseOnEnd=0

" Python Code Validation against PEP8 by <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

" Code auto complete by <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

map <C-q> :bd<CR>          " CTRL+Q - Close current buffer

nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>

"=====================================================
" User functions
"=====================================================

" Add your vim functions to this section.

"=====================================================
" Languages support
"=====================================================

" --- C/C++/C# ---
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" --- JavaScript ---
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript noremap <buffer> <leader>r :call JsBeautify()<cr>
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args='--config ~/.vim/extern-cfg/jshint.json'

" --- Python ---
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent 
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
\ --max-line-length=80'

" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" --- template language support (SGML / XML too) ---
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1
let g:syntastic_html_checkers = []
