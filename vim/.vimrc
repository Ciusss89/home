
" Display options
syntax on
set cursorline
"set number
set list!
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«
if $TERM =~ '256color'
	set t_Co=256
elseif $TERM =~ '^xterm$'
	set t_Co=256
endif

set background=dark
colorscheme vendetta

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Misc
filetype plugin indent on
set hidden
set wildmenu
set wildmode=list:longest,full
set backspace=eol,start,indent
set complete=.,w,b,u,U,t,i,d
set updatecount=100
set directory=~/.vim/swap
set diffopt=filler,iwhite
set history=1000
set scrolloff=3
set visualbell t_vb=
set shortmess+=A
set laststatus=2

" up/down on displayed lines, not real lines. More useful than painful.
noremap k gk
noremap j gj

" Formatting, indentation and tabbing
set autoindent smartindent
set smarttab
"set expandtab
set tabstop=8
set shiftwidth=8
set textwidth=80
set formatoptions-=t formatoptions+=croql

" viminfo: remember certain things when we exit
" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"   %    : saves and restores the buffer list
"   '100 : marks will be remembered for up to 30 previously edited files
"   /100 : save 100 lines from search history
"   h    : disable hlsearch on start
"   "500 : save up to 500 lines for each register
"   :1000 : up to 1000 lines of command-line history will be remembered
"   n... : where to save the viminfo files
set viminfo=%100,'100,/100,h,\"500,:1000,n~/.vim/viminfo
"
" " ctags: recurse up to home to find tags. See
" " http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
" " for an explanation and other ctags tips/tricks
set tags+=./TAGS;$HOME

" Undo
set undolevels=10000
if has("persistent_undo")
	set undodir=~/.vim/undo
	set undofile
endif

" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\     exe "normal g'\"zz" |
	\ endif |

" Aftier 4s of inactivity, check for external file modifications on next keyrpress
au CursorHold * checktime

augroup vimrc_autocmds
	autocmd BufEnter *.c,*.h highlight OverLength ctermbg=darkgrey guibg=#592929
	autocmd BufEnter *.c,*.h match OverLength /\%81v.*/
augroup END
