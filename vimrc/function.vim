function! TabToSpace()
    set expandtab
    retab
endfunction
command! TabToSpace call TabToSpace()

function! SayWhatIsSet(word)
    let warn_msg_head = "warning"
    let word = a:word
    " check if 'word' starts with 'CONFIG_'
    if stridx(word, "CONFIG_") == 0
        let filename = findfile(".config", ".;")
        " check if '.config' exists
        if filename != ""
            let found = 0
            " iterate the lines of the file
            for line in readfile(filename, '')
                " check if 'line' starts with 'CONFIG_xxxx='
                if stridx(line, word . '=') == 0
                    " offset for value in line
                    let offset = strlen(word) + 1
                    " parse value in line
                    let val = strpart(line, offset)
                    echo val == 'y' ? "yes" : val
                    let found = 1
                    break
                endif
            endfor
            if found == 0 | echo "no" | endif
        else
            echo warn_msg_head . " : " . "'.config' file does NOT exist !"
        endif
    els
        echo warn_msg_head . " : " . "This word does NOT start with 'CONFIG' !"
    endif
endfunction
command! SayWhatIsSet call SayWhatIsSet(expand("<cword>"))
nmap <silent> <leader>s :call SayWhatIsSet(expand("<cword>"))<CR>

function! SayGitBlameLine()
    let status = system("git status")
    if stridx(status, "fatal:") == 0
        echo "Not a git repository"
    else
        let filename = expand('%:p')
        let linenum = line(".")
        let blame = system('git blame "$(basename '.filename.')" -L "$(basename '.linenum.')",+1')
        echo strpart(blame, 0, stridx(blame, ')') + 1)
    endif
endfunction
command! SayGitBlameLine call SayGitBlameLine()
nmap <silent> <leader>g :call SayGitBlameLine()<CR>

" remove
command! RemoveTrailingSpace :%s/\s\+$//ge
command! RemoveNewLineChar :%s///ge

" toggle
command! LineNumToggle :set number!
command! PasteToggle :set paste!
