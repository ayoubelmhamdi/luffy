function! MyFoldText()
    let nl = v:foldend - v:foldstart + 1
    let comment = substitute(getline(v:foldstart),"^--{{{ ","",1)
    " let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
    " let txt = '+ ' . linetext . ' : "' . comment . '" : length ' . nl
    let txt = comment . '  ' . nl
    return txt
endfunction
set foldtext=MyFoldText()
