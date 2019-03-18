let g:Gtags_Auto_Update = 1
let g:Gtags_Close_When_Single = 1

" gtags command
nmap <C-\>s :Gtags <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>r :Gtags -r <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :Gtags -g <C-R>=expand("<cword>")<CR><CR>
nmap <C-n> :cn<CR>
nmap <C-m> :cp<CR>
nmap <C-\><C-]> :GtagsCursor<CR>
nmap <C-\><SPACE> :Gtags<SPACE>
