" Pathogen
execute pathogen#infect()

" load filetype-specific indent files
filetype plugin indent on

" general setup

"*******************************************
"" Basic Setup
"*******************************************
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Sets how many lines of history VIM has to remember
set history=500

"" Set to auto read when a file is changed from the outside
set autoread

"" Ignore compiled files
set wildignore=*.0,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"" Fix backspace indent
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Be smart when using tabs
set smarttab

set ai ""Auto indent
set si ""Smart indent
set wrap ""Wrap indent

"" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"" Map leader  
let mapleader = " "

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Don't redraw while excuting macros (good performance config)
set lazyredraw

"" For regular expressions turn magic on
set magic

"" Add a bit extra margin to the left
"" set foldcolumn=1

set fileformats=unix,dos,mac

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1


" Set 7 lines to the cursor
set so=7

"*******************************************
"" Visual Settings
"*******************************************

"" Visual mode pressing * or # searches for the current selection
"" vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
"" vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


syntax on
set ruler
set number

let no_buffers_menu=1
silent! colorscheme molokai

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

"" Alsways show the status line
set laststatus=2
"" Statusline format setting
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Search mapping
nnoremap n nzzzv
nnoremap N Nzzzv

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"************************************************************
"" Abbreviations
"************************************************************
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall



"************************************************************
"" Mapping
"************************************************************
" Remap VIM 0 to first non-blank character
map 0 ^

"" Fast saving
nmap <leader>fs :w!<cr>
nmap <leader>qq :q<cr>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

""Tabs
"nnoremap <Tab> gt
"nnoremap <S-Tab> gT
"nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>ff :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens an tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" ale
"let g:ale_enabled = 1
"let g:ale_linters = {}
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_insert_leave = 1

" tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" Buffer nav
noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
noremap <leader>bd :bd<CR>
"" close all buffers
map <leader>ba :bufdo bd<cr>

"" Switching windows
" noremap <leader>wj <C-w>j
" noremap <leader>wk <C-w>k
" noremap <leader>wl <C-w>l
" noremap <leader>wh <C-w>h
"" some other setting
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


let python_highlight_all =1

set background=dark

" NERD_tree config
let NERDTreeChDirMode=2
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" open Nerdtree when vim starts up if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" close vim if only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" syntastic config
" set statusline+=%#warningms
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list =1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


" ale
":call extend(g:ale_linters, {
    "\'python': ['flake8'], })
"let g:ale_sign_column_always = 1
let g:ale_linters = {
            \ 'javascript': ['jshint'],
            \ 'python': ['flake8'],
            \ 'c': 'all',
            \}
"Only run linting when saving the file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0

" Syntax highlight
" use default highlight
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

"" Return to last edit postition when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""
"" => Spell checking
"""""""""""""""""""""""""""""
"" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"set foldmethod=indent"

"" my old setting
set showcmd
set cmdheight=2
set wildmenu
set showmatch
set mat=2
set cursorline
set clipboard=unnamed

"au BufNewfile,BufRead *.py
    "\ set tabstop=4 |
    "\ set softtabstop=4 |
    "\ set shiftwidth=4 |
    "\ set textwidth=79 |
    "\ set expandtab |
    "\ set autoindent|
    "\ set fileformat=unix

"" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

"" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

"" Toggle Tagbar
nmap <F8> :TagbarToggle<CR>
