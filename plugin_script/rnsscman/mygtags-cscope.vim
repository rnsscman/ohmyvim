let GtagsCscope_Ignore_Case = 1
set cscopetag

" gtags-cscope command
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>a :cs find a <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-n> :tn<CR>
nmap <C-@><C-m> :tp<CR>
nmap <C-@><SPACE> :cs find<SPACE>
nmap <F10> :GtagsCscope<CR>
