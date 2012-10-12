" Maintainer:	Stephen Coward <stephendcoward@gmail.com>
" Last change:	2012 Jul 11

""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""
set nocompatible
call pathogen#infect()
filetype plugin indent on  	" Automatically detect file types.
syntax on   " syntax highlighting
let g:vikiNameTypes = "sSeuix"

" hides tabs?
set hidden

set background=dark
colorscheme solarized

set autoread

set backupdir=~/tmp
set directory=~/tmp

set history=100
set virtualedit=onemore
set viewoptions=folds,options,cursor,unix,slash

" add omnifunc
set ofu=syntaxcomplete#Complete

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Buffer stuff
:nnoremap <F5> :buffers<CR>:buffer<Space>

""""""""""""""""""""""""""""""
" => Vim UI
""""""""""""""""""""""""""""""
	set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	if has('cmdline_info')
		set ruler                  	" show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		set showcmd                	" show partial commands in status line and
									" selected characters/lines in visual mode
	endif

	set backspace=indent,eol,start	" backspace for dummys
	set linespace=0					" No extra spaces between rows
	set nu							" Line numbers on
	set showmatch					" show matching brackets/parenthesis
	set incsearch					" find as you type search
	set hlsearch					" highlight search terms
	set winminheight=0				" windows can be 0 line high 
	set ignorecase					" case insensitive search
	set smartcase					" case sensitive when uc present
	set wildmenu					" show list instead of just completing
	set wildmode=list:longest,full	" command <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5 				" lines to scroll when cursor leaves screen
	set scrolloff=3 				" minimum lines to keep above and below cursor
	set foldenable  				" auto fold code
	set gdefault					" the /g flag on :s substitutions by default
    
""""""""""""""""""""""""""""""
" => Formatting
""""""""""""""""""""""""""""""
" Formatting {
	set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=4               	" use indents of 4 spaces
	set expandtab 	  	     		" tabs are spaces, not tabs
	set tabstop=4 					" an indentation every four columns
	set softtabstop=4 				" let backspace delete indent
	"set matchpairs+=<:>            	" match, to be used with % 
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
	" Remove trailing whitespaces and ^M chars
	autocmd FileType c,cpp,java,php,js,python,twig,xml,yml,as autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" ActionScript
au BufNewFile,BufRead *.as,		setf actionscript

""""""""""""""""""""""""""""""
" => Key (re)Mappings
""""""""""""""""""""""""""""""
    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_
	
	" Shortcuts
	" Change Working Directory to that of the current file
	cmap cd. lcd %:p:h

"""""""""""""""""""""""""""""
" => VimClojure section
" """""""""""""""""""""""""""
let vimclojure#ParenRainbow = 1
let vimclojure#HighlightBuiltins = 1

""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""
source ~/.vim/vimrcs/plugins_config.vim
