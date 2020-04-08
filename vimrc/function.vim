function RemoveTrailingSpace()
    %s/\s\+$//e
    ''
endfunction
command! RemoveTrailingSpace call RemoveTrailingSpace()

function RemoveNewLineChar()
    %s///g
    ''
endfunction
command! RemoveNewLineChar call RemoveNewLineChar()

function TabToSpace()
    set expandtab
    retab
endfunction
command! TabToSpace call TabToSpace()
