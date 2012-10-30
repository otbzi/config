":colorscheme darkblue

set nocompatible

syntax enable
set syntax=on

set noeb

set confirm

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

filetype on

filetype plugin on

filetype indent on

set viminfo+=!

set iskeyword+=_,$,@,%,#,-

set linespace=0

"set wildmenu
set wildmode=list:longest

set backspace=2

set whichwrap+=<,>,h,l

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
autocmd filetype ruby,haml,erb,html,slim,yaml,scss,sass,coffee,treetop,htmldjango set shiftwidth=2
autocmd filetype ruby,haml,erb,html,slim,yaml,scss,sass,coffee,treetop,htmldjango set tabstop=2

nnoremap ; :
inoremap jj <ESC>

"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>

set tags=tags;
set autochdir

if has('autocmd')
	function! RemoveTrailingSpace()
		if $VIM_HATE_SPACE_ERRORS != '0'
			normal m`
			silent! :%s/\s\+$//e
			normal ``
		endif
	endfunction
	autocmd BufWritePre *.c,*.cpp,*.h,*.py call RemoveTrailingSpace()
endif

" highlight space errors in C/C++ source files (Vim tip #935)
if $VIM_HATE_SPACE_ERRORS != '0'
	let c_space_errors=1
endif

"autocmd FileType python let &makeprg='pylint % -i y -r n -f parseable'
"autocmd BufWritePost *.py make
