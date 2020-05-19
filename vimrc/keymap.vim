nmap <leader>c :close<CR>
nmap <leader>q :quit<CR>
nmap <leader>x :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <C-\>] :vs<CR> :exec("tag ".expand("<cword>"))<CR>

nmap <silent> <CR> :call SayWhatIsSet(expand("<cword>"))<CR>
