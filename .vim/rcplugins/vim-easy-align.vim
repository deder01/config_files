" Shorcuts to align key value pairs
Plug 'junegunn/vim-easy-align'

let g:easy_align_ignore_groups = ['Comment', 'String']
nmap ga <Plug>(EasyAlign)
xmap <leader>ga <Plug>(EasyAlign)<right>:
xmap ga <Plug>(EasyAlign)
