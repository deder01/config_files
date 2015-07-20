"The essentials
set nocompatible
set autoindent
syntax on
set hidden
colorscheme desert

" Set up vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype on
filetype plugin on
filetype plugin indent on


Bundle 'gmarik/vundle'
Bundle 'tomasr/molokai'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jgdavey/tslime.vim'
Bundle 'majutsushi/tagbar'
Bundle 'DirDiff.vim'
Bundle 'spell'
Bundle 'tpope/vim-markdown'
Bundle 'JavaScript-Indent'
Bundle 'vimwiki'
Bundle 'moll/vim-bbye'

"Tagbar settings
let g:tagbar_compact = 1
noremap <silent> <C-e> :TagbarToggle<CR>

"Nerdtree settings
noremap <silent> <C-o> :NERDTreeToggle<CR>

"Show tabs as '>.' and make them dark grey
set list
set listchars=tab:\>.
hi SpecialKey ctermfg=DarkGrey guifg=DarkGrey
hi NonText ctermfg=DarkGrey guifg=DarkGrey

"Turn on syntax for hamlp
au BufRead,BufNewFile *.hamlpy set ft=haml

"End lines at 920 columns
set textwidth=920

"Set the map leader to a comman
let mapleader=","

"Make sure I ain't cheating with those arrow keys!
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Turn off inserting comments just cuz the line before was one
set formatoptions-=or

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
noremap Y y$

"Map space to for fast movement in visual mode
noremap <Space> 5

"Press enter for a newline
nnoremap <silent> <CR> :put=''<CR>

inoremap ;; :
"Map semicolon to end of line
noremap ;a ^
noremap ;; $
noremap % K
noremap K %

"Remap jj to escape, so we can move in and out of visual mode
inoremap jj <Esc>
noremap ff <Esc>

"And make sure I aint' cheating with no escape key!
imap <Esc> <nop>

" Better command-line completion
set wildmenu


" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
"
" Case Stuff
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start


" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Turn off error bells
set noerrorbells
set novisualbell

" Enable use of the mouse for all modes
set mouse=a


" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set softtabstop=2
"set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
" set expandtab
set expandtab

set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftwidth=4


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" CTRL-C to copy (visual mode)
vmap <C-c> "+y
" CTRL-X to cut (visual mode)
vmap <C-x> "+x
" CTRL-X to cut (visual mode)
vmap <C-v> <esc>"+gP


function! MarkWindowSwap()
	let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
	"Mark destination
	let curNum = winnr()
	let curBuf = bufnr( "%" )
	exe g:markedWinNum . "wincmd w"
	"Switch to source and shuffle dest->source
	let markedBuf = bufnr( "%" )
	"Hide and open so that we aren't prompted and keep history
	exe 'hide buf' curBuf
	"Switch to dest and shuffle source->dest
	exe curNum . "wincmd w"
	"Hide and open so that we aren't prompted and keep history
	exe 'hide buf' markedBuf
endfunction

noremap <silent> <leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <leader>pw :call DoWindowSwap()<CR>