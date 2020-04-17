function TabToSpace()
    set expandtab
    retab
endfunction
command! TabToSpace call TabToSpace()

" remove
command! RemoveTrailingSpace :%s/\s\+$//ge
command! RemoveNewLineChar :%s///ge

" toggle
command! LineNumToggle :set number!
command! PasteToggle :set paste!
