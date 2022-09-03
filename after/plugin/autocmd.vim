


augroup General
  autocmd!
  autocmd BufWritePost *.sh,*.pl,*.py silent !chmod +x %
  autocmd BufNewFile,BufRead *.m3u set encoding=utf-8 fileencoding=utf-8 ff=unix
  autocmd BufRead,BufNewFile *.conf		setfiletype bash
  autocmd BufRead,BufNewFile *.fish		setfiletype fish
  autocmd BufWritePost X{resources,defaults} silent !xrdb %
  autocmd FileType txt,markdown,asciidoc*,rst if &filetype !~ 'man\|help' | setlocal spell | endif
  autocmd FileType help,man,startuptime,qf,lspinfo,checkhealth nnoremap <buffer><silent>q :bdelete<CR>
  autocmd BufWinEnter * if &previewwindow | setlocal nofoldenable | endif
augroup END


augroup Help
  autocmd!
  autocmd BufWinEnter * if &filetype =~ 'help' | wincmd L | vertical resize 84 | endif
  autocmd BufWinEnter * if &filetype =~ 'man' | wincmd L | wincmd = | endif
  autocmd FileType man,help,*doc setlocal nonumber norelativenumber nospell nolist nocursorcolumn
augroup END
