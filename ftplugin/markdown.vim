set linebreak wrap

vnoremap ` "ddi`<C-r>d`<Esc>
vnoremap * "ddi*<C-r>d*<Esc>gvlol
vnoremap u "ddi<u><C-r>d</u><Esc>gv7l

nnoremap + md:s/^#* */#&/\|s/^\(#*\)\( *\)/\1 /<cr><esc>`dl
nnoremap - md:s/^# \?//<cr><esc>`dl

" how toggele: to use one key
nnoremap <space>+ md:s/^/- /<cr><esc>`dl
nnoremap <space>- md:s/^- \?//<cr><esc>`dl
" test random lettres 12345654321 12321
