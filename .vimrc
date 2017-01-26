
"let $VIMHOME = $HOME."/.vim"

" no vi-compatible
set nocompatible

"required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'Valloric/YouCompleteMe'

"syntactic helper with warnings
"Plugin 'scrooloose/syntastic'

Plugin 'easymotion/vim-easymotion'

"improves comment insertion
Plugin 'scrooloose/nerdcommenter'

"enable repeating supported plugin maps with .
Plugin 'tpope/vim-repeat'

"fancy statusline
Plugin 'bling/vim-airline'

Plugin 'flazz/vim-colorschemes'

"tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

"Plugin 'davidhalter/jedi-vim'

"git stuff (like git info for airline statusline)
Plugin 'tpope/vim-fugitive'

"git auto diff
Plugin 'airblade/vim-gitgutter'

"marks
"Plugin 'kshenoy/vim-signature'

"colors
Plugin 'luochen1990/rainbow'

"convert quotes and stuff
Plugin 'tpope/vim-surround'

"perl syntax
"Plugin 'vim-perl/vim-perl'

"undo tree window
Plugin 'mbbill/undotree'


"templates

"errors!
"Plugin 'vim-scripts/Vimplate-Enhanced'
"Plugin 'vim-scripts/vimplate'


"latex
"Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'lervag/vimtex'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required






" Sets how many lines of history VIM has to remember
set history=700


" Set to auto read when a file is changed from the outside
set autoread

let mapleader = ","
"let g:mapleader = ","
"comentado, no se que hace g:   tal vez sea para gvim

"Fast common commands
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

"annoying else
"but more annoying is to wait each time you use ':'
"nnoremap :X :x<cr>

"copy to end of line without \n
nmap yu yg$

"visual
"copy
"vnoremap <C-c> "+y
"y/p and clipboard sharing, shared paste!
"set clipboard=unnamedplus
set clipboard^=unnamed,unnamedplus
"text copied in vim is shared with clipboard now
set go+=a



"esc
"nnoremap <Esc> i

"noremap º %
nmap º %
"nnoremap c <Nop>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


" Toggle paste mode
"   (prefer this over 'pastetoggle' to echo current state)
"nmap <C-p> :setlocal paste!<cr>

"Toogle smartcase
"nmap <C-S-c> :setlocal ignorecase!<cr>


"delete current selection into 'black hole register'
nmap D "_d
vmap D "_d
nmap <leader>d "_d
vmap <leader>d "_d

imap <C-v> <Esc>"+p

"delete current selection into 'black hole register' and paste
nmap <C-p> V"_dP
function! Paste_black_register()
	normal! gv"_d
	if col(".") == col("$")
		normal! p
	else
		normal! P
	endif
endfunction
vmap <C-p> :call Paste_black_register()<CR>

"paste in new line
nmap = o<Esc>"+p
"and with a blank line between
"nmap ? o<Cr><Esc>"+p


nmap <C-u> yyp

"search visual selected text
vnoremap // y/<C-R>"<CR>
vnoremap ç y/<C-R>"<CR>

" Reselect visual block after numeric increment/decrement
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv

"surround		https://stackoverflow.com/questions/17537182/is-there-anyway-to-change-vim-surrounds-keymapping
"not working
"let g:surround_no_mappings = 1
"xnoremap S <Plug>VSurround
"xnoremap <leader>S <Plug>VSurround
"xnoremap <leader><leader>S <Plug>VSurround

xmap <leader>S S"
xmap <leader><leader>S S'
nmap <leader>S viwS"
nmap <leader><leader>S viwS'
nmap <leader>a viwS"
nmap <leader><leader>a viwS'



"easymotion
let g:EasyMotion_do_mapping = 0     " Disable default mappings
"nmap <Leader> <Plug>(easymotion-prefix)

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap z <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
map s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

"Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


map  <space> <Plug>(easymotion-sn)
omap <space> <Plug>(easymotion-tn)


"old search new maps
noremap <C-n> n
noremap <C-b> N


map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)


"vim-gitgutter
nmap <leader>hn <Plug>GitGutterNextHunk
nmap <leader>hb <Plug>GitGutterPrevHunk
"and performance
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0


"toogle comments!
noremap <leader><leader>c :call NERDComment(0,"toggle")<C-m>
map <C-c> :call NERDComment(0,"toggle")<C-m>

"http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor
noremap <Leader>s :%s/\<<C-r><C-w>\>/
noremap <Leader><Leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/g


"wordcount
nmap <C-w> :!texcount %<Cr>

noremap Z 0
noremap z _

imap <C-a> <Home>
map <C-a> <Home>
imap <C-e> <End>
map <C-e> <End>

"move to previous change
noremap <Left> g;
noremap <Right> g,

"move backwards to the next section end
"noremap ,,b []
noremap <leader>e []

"orden alfabetico e,f	back,next

"move forward to the next section end
"noremap ,,f ][
noremap <leader>f ][

"move to the beginning of the block
noremap <leader>b [{

"not needed, use the other and %
"move to the end of the block
"noremap <leader>e ]}

"go tag declaration
noremap <leader>z <C-]>
"come back	<C-o>


"[/ 	 "Move to the beginning of the comment block
"]/ 	 "Move to the end of the comment block


"key for moving to marked position
noremap + `


"noremap - <C-o>

"select the whole line, copy, select again, comment, insert empty line for separation, paste original above
vnoremap <C-g> Y<CR>gv:call NERDComment(0,"toggle")<CR>`<O<Esc>P



"fast delete words
inoremap <A-BS> <C-w>
nnoremap <A-BS> bdw
inoremap <A-Del> <Esc>dwi
nnoremap <A-Del> dw

"enter key
nnoremap <CR> o
"nnoremap <S-CR> O		"not working


"replace all line jumps with space
nnoremap <leader>l J


"actually selecting only 1 character
"subs all selected characters to its spanish special version, respecting case
"g flag=all, no question
"e flag=ignore errors
"\%V for only selection instead of whole line
nnoremap <C-i> :set ignorecase!<CR>v:s/\%VN/Ñ/ge<CR>gv:s/\%Vn/ñ/ge<CR>gv:s/\%VA/Á/ge<CR>gv:s/\%VE/É/ge<CR>gv:s/\%VI/Í/ge<CR>gv:s/\%VO/Ó/ge<CR>gv:s/\%VU/Ú/ge<CR>:s/\%Va/á/ge<CR>gv:s/\%Ve/é/ge<CR>gv:s/\%Vi/í/ge<CR>gv:s/\%Vo/ó/ge<CR>gv:s/\%Vu/ú/ge<CR>:set ignorecase!<CR>
vnoremap <C-i> <Esc>:set ignorecase!<CR>gv:s/\%VN/Ñ/ge<CR>gv:s/\%Vn/ñ/ge<CR>gv:s/\%VA/Á/ge<CR>gv:s/\%VE/É/ge<CR>gv:s/\%VI/Í/ge<CR>gv:s/\%VO/Ó/ge<CR>gv:s/\%VU/Ú/ge<CR>:s/\%Va/á/ge<CR>gv:s/\%Ve/é/ge<CR>gv:s/\%Vi/í/ge<CR>gv:s/\%Vo/ó/ge<CR>gv:s/\%Vu/ú/ge<CR>:set ignorecase!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"column line
"set cursorcolumn

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"comentado, no uso windows

"i Turn on the WiLd menu, for tab completion
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases (already set with easy motion search, with both EM doesn't work) 
"set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
"set foldcolumn=1
"comentado, aprovechar espacio

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on
"syntax enable
set background=dark
colorscheme desert


"shell syntax hl for this file
"NOT WORKING
"if @% =~ '.common_env'
	"set syntax=sh
"endif





" Set extra options when running in GUI mode
if has("gui_running")
	try
		set t_Co=256
	catch
	endtry

    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
    hi Search guibg=Yellow
"    hi Search guibg=peru guifg=wheat
else
	try
	" Use 256 colours (Use this setting only if your terminal supports 256 colours)
		set t_Co=256
	catch

	endtry
    hi Search ctermbg=Yellow
"    hi Search cterm=NONE ctermfg=grey ctermbg=blue
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac




"luochen1990/rainbow
"let g:rainbow_conf = {
	"\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	"\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	"\   'operators': '_,_',
	"\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	"\   'separately': {
	"\       '*': {},
	"\       'tex': {
	"\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	"\       },
	"\       'lisp': {
	"\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	"\       },
	"\       'vim': {
	"\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	"\       },
	"\       'html': {
	"\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	"\       },
	"\       'css': 0,
	"\   }
"\}
let g:rainbow_active = 1

"	'guifgs': colors for gui interface, will be used in order.
"	'ctermfgs': colors for terms
"	'operators': describe the operators you want to highlight (note: be careful about special characters which needs escaping, you can find more examples here, and you can also read the vim help about syn-pattern)
"	'parentheses': describe what will be processed as parentheses, a pair of parentheses was described by two re pattern
"	'separately': configure for specific filetypes(decided by &ft), key * for filetypes without separate configuration, value 0 means disable rainbow only for this type of files
"	keep a field empty to use the default setting.


"vim-signature
"function! SignatureGG(lnum)
  "let gg_line_state = filter(copy(gitgutter#diff#process_hunks(gitgutter#hunk#hunks())), 'v:val[0] == a:lnum')
  ""echo gg_line_state

  "if len(gg_line_state) == 0
    "return 'Exception'
  "endif

  "if gg_line_state[0][1] =~ 'added'
    "return 'GitGutterAdd'
  "elseif gg_line_state[0][1] =~ 'modified'
    "return 'GitGutterChange'
  "elseif gg_line_state[0][1] =~ 'removed'
    "return 'GitGutterDelete'
  "endif
"endfunction
"let g:SignatureMarkTextHL   = 'SignatureGG(l:lnum)'
"let g:SignatureMarkerTextHL = 'SignatureMarkerHL'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set expandtab

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
"set lbr
"set tw=500


"not working :(
"nmap <C-a> :setlocal ai! si!<cr>

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :call VisualSelection('f', '')<CR>
"vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

"move more
noremap J 10j
noremap K 10k
noremap H 10h
noremap L 10l

"move MORE
nmap <c-h> %

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"nnoremap <space> /
"nnoremap <c-space> ?

" Disable highlight when <leader><cr> is pressed
"noremap <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
"noremap <C-j> <C-W>j
"noremap <C-k> <C-W>k
"noremap <C-h> <C-W>h
"noremap <C-l> <C-W>l

" Close the current buffer
"noremap <leader>bd :Bclose<cr>

" Close all the buffers
"noremap <leader>ba :1,1000 bd!<cr>

" Useful noremappings for managing tabs
"noremap <leader>tn :tabnew<cr>
"noremap <leader>to :tabonly<cr>
"noremap <leader>tc :tabclose<cr>
"noremap <leader>tm :tabmove
"noremap <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nmap <leader>tl :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
"noremap <leader>cd :cd %:p:h<cr>:pwd<cr>


" Specify the behavior when switching between buffers
"try
""  set switchbuf=useopen,usetab,newtab
""  set stal=2
""comentado, barra de arriba tocapelotas fuera
"catch
"endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
"set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

"vim-airline
let g:airline#extensions#syntasctic#enabled=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tagbar#enabled=0			"performance

"custom field (copied and modified)
let g:airline_section_c="%<%f%m                   %{strftime('%Y_%m_%d--%H:%M',getftime(expand('%')))}      %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"


"call airline#extensions#append_to_section('z','%C')
"let g:airline_section_z=airline#section#create_right(['%l','%c'])
"%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#%#__restore__#%#__accent_bold#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#%#__restore__# :%3v

let g:airline_section_z="%p%% %5l|%L %3v_%{strdisplaywidth(getline('.'))}"

" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''

"Always show statusline
set laststatus=2
set noshowmode

let g:airline_powerline_fonts = 0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
"noremap 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ack after the selected text
"vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
"noremap <leader>g :Ack

" When you press <leader>r you can search and replace the selected text
"vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"noremap <leader>cc :botright cope<cr>
"noremap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"noremap <leader>n :cn<cr>
"noremap <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
"noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
"noremap <leader>sn ]s
"noremap <leader>sp [s
"noremap <leader>sa zg
"noremap <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Templates
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"C
autocmd BufNewFile main.c 0r $HOME/Templates/main.c
autocmd BufNewFile Makefile 0r $HOME/Templates/Makefile

"shell
autocmd BufNewFile *.sh 0r $HOME/Templates/script.sh

"latex
let g:tex_flavor = "latex"
autocmd BufNewFile *.tex 0r $HOME/Templates/latex.tex
autocmd BufNewFile *.bib 0r $HOME/Templates/bib.bib


"generic
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"some command info
set showcmd

" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
"noremap <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
"noremap <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
"noremap <leader>pp :setlocal paste!<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! CmdLine(str)
"    exe "menu Foo.Bar :" . a:str
"    emenu Foo.Bar
"    unmenu Foo
"endfunction
"
"function! VisualSelection(direction, extra_filter) range
"    let l:saved_reg = @"
"    execute "normal! vgvy"
"
"    let l:pattern = escape(@", '\\/.*$^~[]')
"    let l:pattern = substitute(l:pattern, "\n$", "", "")
"
"    if a:direction == 'b'
"        execute "normal ?" . l:pattern . "^M"
"    elseif a:direction == 'gv'
"        call CmdLine("Ack \"" . l:pattern . "\" " )
"    elseif a:direction == 'replace'
"        call CmdLine("%s" . '/'. l:pattern . '/')
"    elseif a:direction == 'f'
"        execute "normal /" . l:pattern . "^M"
"    endif
"
"    let @/ = l:pattern
"    let @" = l:saved_reg
"endfunction
"
"
"" Returns true if paste mode is enabled
"function! HasPaste()
"    if &paste
"        return 'PASTE MODE  '
"    endif
"    return ''
"endfunction
"
"" Don't close window, when deleting a buffer
"command! Bclose call <SID>BufcloseCloseIt()
"function! <SID>BufcloseCloseIt()
"   let l:currentBufNum = bufnr("%")
"   let l:alternateBufNum = bufnr("#")
"
"   if buflisted(l:alternateBufNum)
"     buffer #
"   else
"     bnext
"   endif
"
"   if bufnr("%") == l:currentBufNum
"     new
"   endif
"
"   if buflisted(l:currentBufNum)
"     execute("bdelete! ".l:currentBufNum)
"   endif
"endfunction
"



" don't assume the next line is a comment just because this one is
au FileType * setlocal formatoptions-=cro


" ctags optimization
"set autochdir
"set tags=tags;



"
" YouCompleteMe options
"

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''

let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 0


"let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
"let g:ycm_filetype_whitelist = { '*': 1 }
"let g:ycm_key_invoke_completion = '<C-Space>'


"nnoremap <leader>cr :YcmForceCompileAndDiagnostics <CR>


"txt completion, hello?
"let g:ycm_filetype_blacklist = {
        "\ 'tagbar' : 1,
        "\ 'qf' : 1,
        "\ 'notes' : 1,
        "\ 'markdown' : 1,
        "\ 'unite' : 1,
        "\ 'text' : 0,
        "\ 'vimwiki' : 1,
        "\ 'pandoc' : 1,
        "\ 'infolog' : 1,
        "\ 'mail' : 1
        "\}





":set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:➝\ ,trail:~,extends:>,precedes:<
set list!

hi SpecialKey ctermfg=14 guifg=gray
hi CursorColumn ctermbg=black guibg=black


set timeoutlen=1000
set ttimeoutlen=0





"tmux
"http://stackoverflow.com/a/29693196
let tmux_wname=system('tmux display-message -p "#W"')
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window ".tmux_wname)
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title





"STORED REGISTERS
"regex case: from i to [Ii]
let @h='vyi[pvUla]'
