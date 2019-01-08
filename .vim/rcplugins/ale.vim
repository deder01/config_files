" Async linting engine
Plugin 'w0rp/ale'

let g:ale_fixers = {'javascript': ['eslint'], 'typescript': ['tslint']}
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['tsserver', 'tslint']}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

noremap <leader>al :ALELint<CR>
noremap <leader>af :ALEFix<CR>
nmap <silent> <leader>td :TsuDefinition<CR>
nmap <silent> <leader>tn :TsuRenameSymbol<CR>
nmap <silent> <leader>tr :TsuTypeDefinition<CR>
