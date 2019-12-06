execute pathogen#infect()

if filereadable(expand("~/.vim/colors/gruvbox.vim"))
	colorscheme gruvbox
	set background=dark
endif

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
endif

if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
	" Change the default mapping and the default command to invoke CtrlP:
	" let g:ctrlp_map = '<c-p>'
	let g:ctrlp_map = ''
	nmap <F10> :CtrlP<CR>
	nmap <F11> :CtrlPBuffer<CR>

	" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
	let g:ctrlp_working_path_mode = 0

	" Exclude files or directories using Vim's wildignore:
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip

	" http://kien.github.io/ctrlp.vim/#installation
	set runtimepath^=~/.vim/bundle/ctrlp.vim
endif

if isdirectory(expand("~/.vim/bundle/delimitmate"))
endif

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

	nmap <F2> :NERDTreeFind<CR>
	nmap <F3> :NERDTreeToggle<CR>
endif

if isdirectory(expand("~/.vim/bundle/SrcExpl"))
	" // The switch of the Source Explorer
	nmap <F8> :SrcExplToggle<CR>
	"
	" // Set the height of Source Explorer window
	let g:SrcExpl_winHeight = 8
	"
	" // Set 100 ms for refreshing the Source Explorer
	let g:SrcExpl_refreshTime = 100
	"
	" // Set "Enter" key to jump into the exact definition context
	let g:SrcExpl_jumpKey = "<ENTER>"
	"
	" // Set "Space" key for back from the definition context
	let g:SrcExpl_gobackKey = "<SPACE>"
	"
	" // In order to avoid conflicts, the Source Explorer should know what plugins
	" // except itself are using buffers. And you need add their buffer names into
	" // below listaccording to the command ":buffers!"
	let g:SrcExpl_pluginList = [
			\ "__Tagbar__",
			\ "_NERD_tree_",
			\ "Source_Explorer"
		\ ]
	"
	" // The color schemes used by Source Explorer. There are five color schemes
	" // supported for now - Red, Cyan, Green, Yellow and Magenta. Source Explorer
	" // will pick up one of them randomly when initialization.
	let g:SrcExpl_colorSchemeList = [
			\ "Red",
			\ "Cyan",
			\ "Green",
			\ "Yellow",
			\ "Magenta"
		\ ]
	"
	" // Enable/Disable the local definition searching, and note that this is not
	" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
	" // It only searches for a match with the keyword according to command 'gd'
	" let g:SrcExpl_searchLocalDef = 1
	"
	" // Workaround for Vim bug @https://goo.gl/TLPK4K as any plugins using autocmd for
	" // BufReadPre might have conflicts with Source Explorer. e.g. YCM, Syntastic etc.
	" let g:SrcExpl_nestedAutoCmd = 1
	"
	" // Do not let the Source Explorer update the tags file when opening
	" let g:SrcExpl_isUpdateTags = 0
	"
	" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
	" //  create/update a tags file
	" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
	"
	" // Set "<F12>" key for updating the tags file artificially
	" let g:SrcExpl_updateTagsKey = "<F12>"
	"
	" // Set "<F3>" key for displaying the previous definition in the jump list
	" let g:SrcExpl_prevDefKey = "<F3>"
	"
	" // Set "<F4>" key for displaying the next definition in the jump list
	" let g:SrcExpl_nextDefKey = "<F4>"
endif

if isdirectory(expand("~/.vim/bundle/supertab"))
endif

if isdirectory(expand("~/.vim/bundle/tabular"))
endif

if isdirectory(expand("~/.vim/bundle/tagbar"))
	if filereadable("./GTAGS")
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | TagbarOpen | endif
	endif

	nmap <F4> :TagbarToggle<CR>
endif

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

if isdirectory(expand("~/.vim/bundle/vim-airline-themes"))
	" USING A THEME
	let g:airline_theme='simple'
endif

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

if isdirectory(expand("~/.vim/bundle/youcompleteme"))
	let g:ycm_min_num_of_chars_for_completion = 99
endif
