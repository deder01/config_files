" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldmethod=marker
setlocal foldmarker={,}
setlocal foldlevel=1
