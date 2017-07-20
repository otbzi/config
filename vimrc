let $PYTHONPATH .= "/Library/Python/2.7/site-packages"
set rtp+=$GOROOT/misc/vim

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"set rtp+=~/.vim/bundle/vundle/
"set rtp+=~/.vim/bundle/plugin/
"call vundle#rc()

" let Vundle manage Vundle
" required! 
"Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'


" My Plugins here:
"Plugin 'https://github.com/klen/python-mode.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/sjl/gundo.vim.git'
Plugin 'repeat.vim'
"Plugin 'https://github.com/vim-scripts/VimClojure.git'
"Plugin 'https://github.com/kchmck/vim-coffee-script.git'
" only use YO for pastemode
Plugin 'https://github.com/tpope/vim-unimpaired.git' 
"Plugin 'https://github.com/guns/vim-clojure-static.git'
"Plugin 'https://github.com/tpope/vim-fireplace'
"Plugin 'git://github.com/tpope/vim-classpath.git'
Plugin 'https://github.com/solarnz/thrift.vim.git'
"Plugin 'https://github.com/vim-scripts/VimClojure.git'
Plugin 'https://github.com/kien/rainbow_parentheses.vim.git'
Plugin 'https://github.com/jimenezrick/vimerl.git'
Plugin 'https://github.com/fatih/vim-go.git'
Plugin 'cespare/vim-toml'
Plugin 'glib.vim'
"Plugin 'https://github.com/rust-lang/rust.vim'
"Plugin 'https://github.com/Valloric/YouCompleteMe.git'
"Plugin 'vim-scripts/paredit.vim'

"Plugin 'https://github.com/guns/vim-clojure-highlight.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..jj


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set fileencodings=utf-8,usc-bom
set termencoding=utf-8
set encoding=utf-8

set linebreak

syntax enable
set syntax=on
set noeb

set confirm
set showcmd

set autoindent
set cindent

set tabstop=4

set softtabstop=4
set shiftwidth=4

set expandtab

set smarttab

set number

set history=1000

set nobackup
set noswapfile

"set ignorecase

set hlsearch
set incsearch

set gdefault

"set enc=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"set langmenu=zh_CN.UTF-8
"set helplang=cn

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

set laststatus=2

set ruler           

set cmdheight=2

"filetype on
"
"filetype plugin on
"
"filetype indent on

set viminfo+=!

set iskeyword+=_,$,@,%,#,-

set linespace=0

"set wildmenu
set wildmode=list:longest

set backspace=2

set wrap
set whichwrap+=<,>,h,l
set formatoptions+=mM

set mouse=a
set selection=exclusive
set selectmode=mouse,key

set report=0

set shortmess=atI

set fillchars=vert:\ ,stl:\ ,stlnc:\

set showmatch

set matchtime=5

set scrolloff=3

set smartindent

autocmd filetype * set shiftwidth=4
autocmd filetype * set tabstop=4
autocmd FileType ruby,haml,erb,html,slim,yaml,scss,sass,coffee,treetop,htmldjango,clojure,javascript,sql set shiftwidth=2
autocmd FileType ruby,haml,erb,html,slim,yaml,scss,sass,coffee,treetop,htmldjango,clojure,javascript,sql set tabstop=2

nnoremap ; :
inoremap jj <ESC>
"set clipboard+=unnamed
set pastetoggle=<F9>
set ff=unix


"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>

"vmap <D-j> gj
"vmap <D-k> gk
"vmap <D-4> g$
"vmap <D-6> g^
"vmap <D-0> g^
"nmap <D-j> gj
"nmap <D-k> gk
"nmap <D-4> g$
"nmap <D-6> g^
"nmap <D-0> g^

set tags=tags;
"set autochdir

if has('autocmd')
	function! RemoveTrailingSpace()
		if $VIM_HATE_SPACE_ERRORS != '0'
			normal m`
			silent! :%s/\s\+$//e
			normal ``
		endif
	endfunction
	autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.py,*.clj,*.coffee,*.js,*.erl,*.html,*.md,*.toml,*.example call RemoveTrailingSpace()
endif

" highlight space errors in C/C++ source files (Vim tip #935)
if $VIM_HATE_SPACE_ERRORS != '0'
	let c_space_errors=1
endif

" for ctrlp matcher
let g:path_to_matcher = "/usr/local/bin/matcher"

let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']

let g:ctrlp_match_func = { 'match': 'GoodMatch' }

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)

  " Create a cache file if not yet exists
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")

endfunction


" for pymode
"let g:pymode_rope = 1
"let g:pymode_folding = 0
"let g:pymode_lint_write = 0
"let g:pymode_options = 0 " pymode will set nowrap if this == 1
"let g:pymode_syntax = 0

set syntax=glib 

let g:go_fmt_command = "goimports"

"set equalprg=astyle\ --style=google

