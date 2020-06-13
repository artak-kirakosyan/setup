
" General {{{
	set nocompatible
	syntax on
	filetype plugin indent on
	"set shell=bash
	"set ttyfast   " faster redraw
	"set so=7
	"set ruler
	"set magic
	"set cmdheight=1
	"set autoread
	"set mat=2
	"set t_vb=
	"set tm=500
	"set smarttab
	"set lbr
	"set tw=500
	"set ai
	"set si
    set noswapfile		
	set wrap
	let mapleader=","
	"set nowrap  " don't wrap lines
	set backspace=indent,eol,start
	" Enable mouse usage (!)
	set mouse-=a

	" C-U in insert/normal mode, to uppercase the word under cursor
	inoremap <c-u> <esc>viwUea
	nnoremap <c-u> viwUe

	" Quote words under cursor
	nnoremap <leader>" viW<esc>a"<esc>gvo<esc>i"<esc>gvo<esc>3l
	nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

	" Quote current selection
	" TODO: This only works for selections that are created "forwardly"
	vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
	vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll

	" Use shift-H and shift-L for move to beginning/end
	nnoremap H 0
	nnoremap L $
" }}}

" Colors {{{
	set t_Co=256
	colorscheme molokai
	"colorscheme peaksea
	"colorscheme solarized
	set background=light

	" Cursor line color
	"hi CursorLine   cterm=NONE ctermbg=Yellow ctermfg=202 guibg=NONE guifg=NONE
	hi CursorLine ctermfg=81 ctermbg=16 guifg=#66D9EF guibg=#000000

	" Change Color when entering Insert Mode
	autocmd InsertEnter * highlight  CursorLine term=standout cterm=bold ctermfg=231 ctermbg=238 gui=bold guifg=#FFFFFF guibg=#333333

	" Revert Color to default when leaving Insert Mode
	"autocmd InsertLeave * highlight  CursorLine ctermbg=lightGrey ctermfg=202 guibg=NONE guifg=NONE
	autocmd InsertLeave * highlight  CursorLine ctermfg=81 ctermbg=16 guifg=#66D9EF guibg=#000000

	"Highlights matching brackets.
	"hi MatchParen cterm=none ctermbg=black ctermfg=white


	" Change brackets color
	"hi! link rainbow_p0 Special
	"hi! link rainbow_p1 Special

	" Customize colors for TCL
	hi! link tclVarRef Macro
	hi! link tclVarRef Macro
	hi! link tclVarRef Macro
	hi! link tclNumber Identifier
	hi! link tclConditional Type
	hi! link tclRepeat Type
	hi! link tclCommand Type
	hi! link tclRepeat Type
	hi! link tclConditional Type
    hi! link tcltkCommandColor Type
    hi Visual term=standout ctermfg=118 ctermbg=235 guifg=#A6E22E guibg=#232526
" }}}


" Indent line {{{
	source ~/.vim/bundle/indentLine/after/plugin/indentLine.vim
	let g:indentLine_enabled = 1
	let g:indentLine_setColors = 1
	let g:indentLine_char = '┆'
	let g:indentLine_color_term = 239
	let g:indent_guides_enable_on_vim_startup = 0
" }}}
"
" UI Layout {{{
	set showcmd             " show command in bottom bar
	set wildmenu
	set wildmode=list:longest,full
	set showmatch           " higlight matching parenthesis
	"set nocursorline       " highlight current line
" }}}

" Searching {{{
	set ignorecase          " ignore case when searching
	set smartcase
	" Highlight search color
	hi Search ctermfg=0 ctermbg=222 guifg=#000000 guibg=#F0E68C
" }}}

" Folding {{{
	"set foldenable          " don't fold files by default on open
	set foldmethod=indent   " fold based on indent level
	set foldnestmax=10      " max 10 depth
	set foldlevelstart=10    " start with fold level of 1
	"Mappings to easily toggle fold levels
	vnoremap <Space> za
	nnoremap <space> za
	nnoremap z0 :set foldlevel=0<cr>
	nnoremap z1 :set foldlevel=1<cr>
	nnoremap z2 :set foldlevel=2<cr>
	nnoremap z3 :set foldlevel=3<cr>
	nnoremap z4 :set foldlevel=4<cr>
	nnoremap z5 :set foldlevel=5<cr>
" }}}

" Useful Shortcuts {{{
	map <F2> :set spell <Enter>
	map <F3> :set nospell <Enter>
	map <F4> :noh <Enter>
	map <F5> <Esc> :e <Enter> G
	" Remove space at end of line
	map <F6>  :%s/\s\+$// <Enter>
	" Remove all unwanted space from file
	nnoremap <silent> <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
	map <F8> mzgg=G`z`
" }}}

" Spelling {{{
	set nospell
	hi clear SpellBad
	hi SpellBad cterm=underline ctermfg=red
"}}}

" Backups {{{
	set backup
	set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
	set backupskip=/tmp/*,/private/tmp/*
	set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
	set writebackup
" }}}

" Fixes/workarounds {{{
	"Fix arrow keys that display A B C D on remote shell
	imap <ESC>oA <ESC>ki
	imap <ESC>oB <ESC>ji
	imap <ESC>oC <ESC>li
	imap <ESC>oD <ESC>hi

" Stupid shift key fixes
	cmap W W
	cmap Q Q
"}}}

" CtrlP {{{
	set wildignore+=*.so,*.swp,*.zip,*.git
	set wildignore+=*.swp,*.bak,*.pyc,*.class
	let g:ctrlp_match_window = 'bottom,order:ttb'
	let g:ctrlp_switch_buffer = 0
	let g:ctrlp_working_path_mode = 0
	let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}

" Syntastic {{{
"let g:syntastic_python_flake8_args='--ignore=E501'
	let g:pyflakes_autostart = 0
	let g:syntastic_ignore_files = ['.java$']
	let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['tcl', 'pl', 'py', 'verilog', 'sh']}
" }}}

" Undotree {{{
	let g:undotree_SplitWidth = 110
"}}}

" Ruler {{{
	if exists('+colorcolumn')
		set colorcolumn=79
	else
		au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>85v.\+', -1)
	endif
	hi ColorColumn guibg=#2d2d2d ctermbg=255
"hi ColorColumn guibg=#2d2d2d ctermbg=246
"}}}

" Editing behaviour {{{
	"set showmode                    " always show what mode we're currently editing in
	"set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
	"set copyindent                  " copy the previous indentation on autoindenting
	" case-sensitive otherwise shiftwidth, not tabstop
	"set virtualedit=all             " allow the cursor to go in to "invalid" places
	"set gdefault                    " search/replace "globally" (on a line) by default
	"set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
	set nolist                      " don't show invisible characters by default,
	" but it is enabled for some file types (see later)
	set pastetoggle=<F8>            " when in insert mode, press <F8> to go to
	" paste mode, where you can paste mass data
	" that won't be autoindented
	" supports it (xterm does)
	"set fileformats="unix,dos,mac"
	"set formatoptions+=1            " When wrapping paragraphs, don't end lines
	" with 1-letter words (looks stupid)
	"set nrformats=                  " make <C-a> and <C-x> play well with
	" zero-padded numbers (i.e. don't consider
	" them octal or hex)
	"set shortmess+=I                " hide the launch screen
	"set clipboard=unnamed           " normal OS clipboard interaction

	" Toggle show/hide invisible chars
	"nnoremap <leader>i :set list!<cr>

	" Toggle line numbers
	"nnoremap <leader>N :setlocal number!<cr>

	" Thanks to Steve Losh for this liberating tip
	" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
	"nnoremap / /\v
	"vnoremap / /\v
"}}}

" Line Shortcuts {{{
	nnoremap j gj
	nnoremap k gk
	nnoremap B ^
	nnoremap E $
	nnoremap $ <nop>
	nnoremap ^ <nop>
	nnoremap gV `[v`]
" }}}

" Shortcut mappings {{{
	" Since I never use the ; key anyway, this is a real optimization for almost
	" all Vim commands, as I don't have to press the Shift key to form chords to
	" enter ex mode.
	nnoremap ; :
	nnoremap <leader>; ;

	" Avoid accidental hits of <F1> while aiming for <Esc>
	noremap! <F1> <Esc>

	nnoremap <leader>Q :q<CR>    " Quickly close the current window
	nnoremap <leader>q :bd<CR>   " Quickly close the current buffer

	" Use Q for formatting the current paragraph (or visual selection)
	vnoremap Q gq
	nnoremap Q gqap
	" set breakindent on  " keep paragraph indentation when re-wrapping text

	" Sort paragraphs
	vnoremap <leader>s !sort -f<CR>gv
	nnoremap <leader>s vip!sort -f<CR><Esc>

	" make p in Visual mode replace the selected text with the yank register
	vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

	" Swap implementations of ` and ' jump to markers
	" By default, ' jumps to the marked line, ` jumps to the marked line and
	" column, so swap them
	nnoremap ' `
	nnoremap ` '

	" Use the damn hjkl keys
	"noremap <up> <nop>
	"noremap <down> <nop>
	"noremap <left> <nop>
	"noremap <right> <nop>

	" Remap j and k to act as expected when used on long, wrapped, lines
	nnoremap j gj
	nnoremap k gk
	" Shortcut to make
	nnoremap mk :make<CR>

	" Easy window navigation
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l
	nnoremap <leader>w <C-w>v<C-w>l

	" Complete whole filenames/lines with a quicker shortcut key in insert mode
	inoremap <C-f> <C-x><C-f>
	inoremap <C-l> <C-x><C-l>

	" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
	" yanked stack (also, in visual mode)
	nnoremap <silent> <leader>d "_d
	vnoremap <silent> <leader>d "_d
	" vnoremap <silent> x "_x  TODODODOOo

	" Quick yanking to the end of the line
	nnoremap Y y$

	" YankRing stuff
	let g:yankring_history_dir = '$HOME/.vim/.tmp'
	nnoremap <leader>r :YRShow<CR>

	" Edit the vimrc file
	nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
	nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

	" Pull word under cursor into LHS of a substitute (for quick search and
	" replace)
	nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

	" Quickly get out of insert mode without your fingers having to leave the
	" home row (either use 'jj' or 'jk')
	inoremap jj <Esc>
	" Jump to matching pairs easily, with Tab
	nnoremap <Tab> %

	" Allow quick additions to the spelling dict
	nnoremap <leader>g :spellgood <c-r><c-w>

	" Sudo to write
	cnoremap w!! w !sudo tee % >/dev/null


	" Quick alignment of text
	" nnoremap <leader>al :left<CR>
	" nnoremap <leader>ar :right<CR>
	" nnoremap <leader>ac :center<CR>

"}}}

" NERDTree settings {{{
	let g:NERDTreeWinSize=77
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
	nnoremap <leader>N :NERDTreeClose<CR>

	" Store the bookmarks file
	let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

	" Show the bookmarks table on startup
	let NERDTreeShowBookmarks=1

	" Show hidden files, too
	let NERDTreeShowFiles=1
	let NERDTreeShowHidden=1

	" Quit on opening files from the tree
	let NERDTreeQuitOnOpen=1

	" Highlight the selected entry in the tree
	let NERDTreeHighlightCursorline=1

	" Use a single click to fold/unfold directories and a double click to open
	" files
	let NERDTreeMouseMode=2

	" Don't display these kinds of files
	let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
				\ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]
" }}}

" Conflict markers {{{
	" highlight conflict markers
	match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

	" shortcut to jump to next conflict marker
	nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>
" }}}

" Python mode configuration {{{
	" Don't run pylint on every save
	let g:pymode = 0
	"let g:pymode_breakpoint = 0
	"let g:pymode_breakpoint_bind = '<leader>b'
	"let g:pymode_doc = 0
	"let g:pymode_doc_bind = 'K'
	"let g:pymode_folding = 0
	"let g:pymode_indent = 0
	"let g:pymode_lint = 0
	"let g:pymode_lint_checkers = ['pep8'']
	"let g:pymode_lint_cwindow = 1
	"let g:pymode_lint_ignore = ''
	"let g:pymode_lint_message = 1
	"let g:pymode_lint_on_fly = 0
	"let g:pymode_lint_on_write = 0
	"let g:pymode_lint_select = ''
	"let g:pymode_lint_signs = 1
	"let g:pymode_motion = 0
	"let g:pymode_options = 0
	"let g:pymode_paths = []
	"let g:pymode_quickfix_maxheight = 6
	"let g:pymode_quickfix_minheight = 3
	"let g:pymode_rope = 1
	"let g:pymode_rope_completion = 0
	"let g:pymode_rope_regenerate_on_write = 0
	"let g:pymode_run = 0
	"let g:pymode_run_bind = '<leader>r'
	"let g:pymode_trim_whitespaces = 0

" }}}

     let g:airline_theme ="wombat"
     if !exists('g:airline_symbols')                                                        
		let g:airline_symbols = {}                                                           
	endif 
    let g:airline_symbols.branch = '⎇'''                                                   
    let g:airline_symbols.readonly = 'Ξ'                                                   
    let g:airline_symbols.linenr = ''

"Find the hi color of the item.
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Spaces & Tabs {{{
	set softtabstop=4      " 2 space tab
	set autoindent
"set modelines=1
"set scrolloff=4
" }}}


"replace tabs with spaces
set expandtab
"number of spaces to replace the tab
set tabstop=4
"display line numbers
set number
"size of the shift
set shiftwidth=4
"highlight the search and do incremental search
set hlsearch
set incsearch
"always display the name of the file
set laststatus=2
"customize statusline
set statusline=
set statusline+=%F
set statusline+=%=
set statusline+=\ %l:%c\ %L
set statusline+=\ %p%%
