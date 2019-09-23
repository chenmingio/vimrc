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

"" Fix backspace indent
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader  
let mapleader = " "

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

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

set autoread

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

"" Switching windows
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l
noremap <leader>wh <C-w>h


let python_highlight_all =1

"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

" NERD_tree config
let NERDTreeChDirMode=2
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list =1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ale
":call extend(g:ale_linters, {
    "\'python': ['flake8'], })
"let g:ale_sign_column_always = 1

" Syntax highlight
" use default highlight
let g:polyglot_disabled = ['python']
let python_highlight_all = 1



"set foldmethod=indent"

"" my old setting
set showcmd
set cmdheight=2
set wildmenu
set showmatch
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

