set autoindent | set smartindent
set hidden

" Encoding necessary for lightline "
set encoding=utf-8
scriptencoding utf-8

" Display line numbers on the left
set relativenumber
set number

" Case Stuff
set ignorecase
set smartcase

""""" Tabs """""
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

"" Grey Tabs ""
"" Show tabs as '>.' and make them dark grey  ""
set list
set listchars=tab:\>.
"" /Grey Tabs ""
""""" /Tabs """""


""""" Preferences """""
set t_Co=256
colorscheme dots
""""" /Preferences """""
"""""""""" /The Essentials """"""""""


"""""""""" Syntax """"""""""
syntax on

" Highlighting for folded lines "
:hi folded ctermfg=blue

"" Strange Fletypes ""
au BufRead,BufNewFile *.hamlpy set ft=haml
au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
au BufRead,BufNewFile *.scss set ft=scss.css
autocmd filetype crontab setlocal nobackup nowritebackup
"" /Strange Fletypes ""

"" Tag matching ""
let g:mta_set_default_matchtag_color = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'javascript.jsx' : 1,
    \ 'jinja' : 1,
    \ 'liquid' : 1,
    \ 'markdown' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \}
"" /Tag matching ""

""""" OmniComplete """""
autocmd FileType typescript setlocal completeopt+=menu
let g:tsuquyomi_completion_detail = 1
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
""""" /OmniComplete """""
" End lines at 920 columns
set textwidth=920

" Easier indenting of blocks
noremap <leader>; :><CR>
noremap <leader>a <<CR>

" My braces are not always on the first column
" Taken directory from :h motion.txt
noremap [[ ?{<CR>w99[{
noremap ]] /}<CR>b99]}
noremap ][ j0[[%/{<CR>
noremap [] k$][%?}<CR>

" Don't insert comment after enter
set formatoptions-=r formatoptions-=c formatoptions-=o

""""" VIM tabs """""
" map <leader>i to move to tab i for 0-9
let i = 1
while i<=9
  exec "nnoremap <Leader>".i." ".i."gt"
  let i+=1
endwhile

noremap <leader>n :tabn<CR>
noremap <leader>p :tabp<CR>
""""" /VIM tabs """""

" Make sure I ain't cheating with those arrow keys!
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" And make sure I aint' cheating with no escape key!
imap <Esc> <nop>

" Split buffer below
set splitbelow

" Map f to 5 for fast movement in visual mode
noremap f 5

" Use semicolon for line movement
noremap ;a ^
noremap ;; $

" Map K to match braces
noremap % K
noremap K %

" Remap jj to escape, so we can move in and out of visual mode
inoremap jj <Esc>
noremap ff <Esc>

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight current line
set cursorline
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Jump to search as I type
set incsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Turn off error bells
set noerrorbells
set novisualbell

"""" Statusline """"
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Show file and column in statusline
set laststatus=2
set statusline=
set ruler
"""" /Statusline """"

" Close location list
noremap <leader>l :lclose<CR>

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Toggle between 'paste' and 'nopaste'
set pastetoggle=<F5>

""""" Mappings """""
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" CTRL-C to copy (visual mode)
vmap <C-c> "+y
" CTRL-X to cut (visual mode)
vmap <C-x> "+x
" CTRL-X to cut (visual mode)
vmap <C-v> <esc>"+gP
