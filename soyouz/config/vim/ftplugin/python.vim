" File ~/.vim/ftplugin/python.vim
" Python specific settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
