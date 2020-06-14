set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattesgroeger/vim-bookmarks'
Plugin 'neoclide/coc.nvim'
Plugin 'kien/ctrlp.vim'
Plugin 'dracula/vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'yggdroot/indentline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kshenoy/vim-signature'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if filereadable(expand("~/.vim/plugin/gtags.vim"))
    let g:Gtags_VerticalWindow = 0
    let g:Gtags_Auto_Map = 0
    let g:Gtags_Auto_Update = 1
    let g:Gtags_No_Auto_Jump = 0
    let g:Gtags_Close_When_Single = 1
    " gtags command
    nmap <C-n> :cn<CR>
    nmap <C-p> :cp<CR>
    nmap <C-\><SPACE> :Gtags<SPACE>
    nmap <C-\>r :Gtags -r <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>s :Gtags -s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :Gtags -g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :Gtags -f %
    nmap <C-\>a :Gtagsa<SPACE>
    nmap <C-\><C-]> :GtagsCursor<CR>
endif

if filereadable(expand("~/.vim/plugin/gtags-cscope.vim"))
    let GtagsCscope_Auto_Map = 0
    let GtagsCscope_Ignore_Case = 1
    let GtagsCscope_Absolute_Path = 0
    let GtagsCscope_Keep_Alive = 0
    if filereadable("./GTAGS")
        let GtagsCscope_Auto_Load = 1
    endif
    set cscopetag
    " gtags-cscope command
    nmap <C-\><C-n> :tn<CR>
    nmap <C-\><C-p> :tp<CR>
    nmap <C-\><C-\><SPACE> :cs find<SPACE>
    nmap <C-\><C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\><C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\><C-\>a :cs find a <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\><C-\><C-]> :cs find d <C-R>=expand("<cword>")<CR>:<C-R>=line('.')<CR>:%<CR>

    nmap <C-\>] :vs<CR> :exec("tag ".expand("<cword>"))<CR>
endif

" airline
if isdirectory(expand("~/.vim/bundle/vim-airline"))
    " Automatically displays all buffers when there's only one tab open.
    let g:airline#extensions#tabline#enabled = 1

    " Separators can be configured independently for the tabline, so here is how
    " you can define "straight" tabs:
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

    " In addition, you can also choose which path formatter airline uses. This
    " affects how file paths are displayed in each individual tab as well as the
    " current buffer indicator in the upper right. To do so, set the formatter
    " field with:
    let g:airline#extensions#tabline#formatter = 'default'
endif

" airline-themes
if isdirectory(expand("~/.vim/bundle/vim-airline-themes"))
    " USING A THEME
    let g:airline_theme='simple'
endif

" bookmarks
if isdirectory(expand("~/.vim/bundle/vim-bookmarks"))
    let g:bookmark_save_per_working_dir = 1
    let g:bookmark_auto_save = 1
endif

" coc.nvim
if isdirectory(expand("~/.vim/bundle/coc.nvim"))
    " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    " set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    " xmap <leader>f  <Plug>(coc-format-selected)
    " nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current line.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for selections ranges.
    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
    " coc-tsserver, coc-python are the examples of servers that support it.
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
endif

" ctrlp
if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
    " Change the default mapping and the default command to invoke CtrlP:
    " let g:ctrlp_map = '<c-p>'
    let g:ctrlp_map = ''
    nmap <Leader>f :CtrlP<CR>
    nmap <Leader>b :CtrlPBuffer<CR>

    " When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
    let g:ctrlp_working_path_mode = 0

    " Exclude files or directories using Vim's wildignore:
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip

    " http://kien.github.io/ctrlp.vim/#installation
    set runtimepath^=~/.vim/bundle/ctrlp.vim
endif

" dracula
if isdirectory(expand("~/.vim/bundle/vim"))
    set background=dark
    " set background=light
    colorscheme dracula
endif

" easymotion
if isdirectory(expand("~/.vim/bundle/vim-easymotion"))
    let g:EasyMotion_do_mapping = 0 " Disable default mappings

    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    nmap s <Plug>(easymotion-overwin-f)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    nmap s <Plug>(easymotion-overwin-f2)

    " Turn on case-insensitive feature
    " let g:EasyMotion_smartcase = 1
    let g:EasyMotion_smartcase = 0

    " JK motions: Line motions
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
endif

" fugitive
if isdirectory(expand("~/.vim/bundle/vim-fugitive"))
endif

" gitgutter
if isdirectory(expand("~/.vim/bundle/vim-gitgutter"))
endif

" indentline
if isdirectory(expand("~/.vim/bundle/indentline"))
    let g:indentLine_enabled = 1
endif

" nerdcommenter
if isdirectory(expand("~/.vim/bundle/nerdcommenter"))
    " Post Installation
    filetype plugin on

    " Settings
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'

    " Set a language to use its alternate delimiters by default
    let g:NERDAltDelims_java = 1

    " Add your own custom formats or override the defaults
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

    " Allow commenting and inverting empty lines (useful when commenting a region)
    let g:NERDCommentEmptyLines = 1

    " Enable trimming of trailing whitespace when uncommenting
    let g:NERDTrimTrailingWhitespace = 1

    " Enable NERDCommenterToggle to check all selected lines is commented or not 
    let g:NERDToggleCheckAllLines = 1

    " Default mappings
    " The following key mappings are provided by default (there is also a menu provided that contains menu items corresponding to all the below mappings):
    " Most of the following mappings are for normal/visual mode only. The |NERDComInsertComment| mapping is for insert mode only.
    " [count]<leader>cc         |NERDComComment|        Comment out the current line or text selected in visual mode.
    " [count]<leader>cn         |NERDComNestedComment|  Same as cc but forces nesting. 
    " [count]<leader>c<space>   |NERDComToggleComment|  Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
    " [count]<leader>cm         |NERDComMinimalComment| Comments the given lines using only one set of multipart delimiters.
    " [count]<leader>ci         |NERDComInvertComment|  Toggles the comment state of the selected line(s) individually.
    " [count]<leader>cs         |NERDComSexyComment|    Comments out the selected lines with a pretty block formatted layout.
    " [count]<leader>cy         |NERDComYankComment|    Same as cc except that the commented line(s) are yanked first.
    " <leader>c$                |NERDComEOLComment|     Comments the current line from the cursor to the end of line.
    " <leader>cA                |NERDComAppendComment|  Adds comment delimiters to the end of line and goes into insert mode between them.
    "                           |NERDComInsertComment|  Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
    " <leader>ca                |NERDComAltDelim|       Switches to the alternative set of delimiters.
    " [count]<leader>cl
    " [count]<leader>cb         |NERDComAlignedComment| Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
    " [count]<leader>cu         |NERDComUncommentLine|  UncommentsUncomments the selected line(s).Uncomments the selected line(s). the selected line(s).
endif

" nerdtree
if isdirectory(expand("~/.vim/bundle/nerdtree"))
    " How can I open a NERDTree automatically when vim starts up?
    " autocmd vimenter * NERDTree

    " How can I open a NERDTree automatically when vim starts up if no files were
    " specified?
    if filereadable("./GTAGS")
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    endif

    " How can I open NERDTree automatically when vim starts up on opening a
    " directory?
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

    " How can I close vim if the only window left open is a NERDTree?
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    nmap <Leader>n :NERDTreeToggle<CR>
endif

" signature
if isdirectory(expand("~/.vim/bundle/vim-signature"))
endif

" snippets
if isdirectory(expand("~/.vim/bundle/vim-snippets"))
endif

" tagbar
if isdirectory(expand("~/.vim/bundle/tagbar"))
    if filereadable("./GTAGS")
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | TagbarOpen | endif
    endif

    nmap <Leader>t :TagbarToggle<CR>
endif

