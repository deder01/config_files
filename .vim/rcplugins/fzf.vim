" Enable the fzf fuzzy finder in vim
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

noremap <silent> <C-k> :Ag<CR>
noremap <silent> <C-j> :FZF<CR>
noremap <silent> <C-h> :Buffers<CR>

let g:fzf_action = {
  \ 'ctrl-t' : 'tab split',
  \ 'ctrl-h' : 'split',
  \ 'ctrl-v' : 'vsplit'
  \ }
