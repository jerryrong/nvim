""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

function! GetRunningOS()
    let os=substitute(system('uname'), '\n', '', '')
    if os == 'Darwin' || os == 'Mac'
        return 'mac'
    elseif os == 'Linux'
        return 'linux'
    endif
endfunction

let platform=GetRunningOS()

" Rebind <Leader> key
let mapleader = ","

set backspace=indent,eol,start
if platform == 'mac'
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif
set history=1000

" Time to wait for a command
set timeoutlen=500
set ttimeoutlen=50

" Set auto read when a file is changed outside of VIM
set autoread
set autowrite

" Change buffer - without saving
set hidden

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" About searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set belloff=all

" Turn on the wild menu
set wildmenu
set wildmode=longest,full
set wildignore=*.o,*~,*.pyc


""""""""""""""""""""""""""""""""""""""""
" => Encoding, fileformat and language
""""""""""""""""""""""""""""""""""""""""
" Set utf-8 encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936,latin-1
set fileencoding=utf-8

if platform == 'linux'
    language messages en_US.utf8
elseif platform == 'mac'
    language messages en_US.UTF-8
endif

" Auto detect file format
set fileformats=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""
" => UI settings
""""""""""""""""""""""""""""""""""""""""
syntax enable
set number
set ruler
set showcmd
set showmatch
set matchtime=2
set wrap
set textwidth=80
set laststatus=2

" Show tabs and spaces and so on
set list
set listchars=tab:▸▸,eol:¬,extends:»,precedes:«

" Indent and tab
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent

augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" Folding settings
 set foldmethod=syntax
 set nofoldenable

" Don't give the intro message
set shortmess=filnxtToOI

" Fonts and colors
if platform == 'mac'
    set guifont=Monaco\ for\ Powerline:h11
else
    set guifont=Fantasque\ Sans\ Mono\ 11.5
endif

if has('nvim')
    set guicursor=
endif

if has('gui_running')
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m

    set lines=100
    set columns=88
endif

if has('termguicolors')
    set termguicolors
endif

set completeopt=menu,menuone,noselect
set mouse=


""""""""""""""""""""""""""""""""""""""""
" => Key mapping
""""""""""""""""""""""""""""""""""""""""
" Bind Ctrl+<movement> keys to move around the windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Make search results appear in the middle on the screen
nnoremap n nzz
nnoremap N Nzz

" Map j and k keys operate on display line
nnoremap k gk
nnoremap j gj

" Map reverse character search command to another key
noremap \ ,

" Remap jj to escape insert mode
inoremap jj <ESC>

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Use left and right to switch buffers
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>


""""""""""""""""""""""""""""""""""""""""
" => Load lua config
""""""""""""""""""""""""""""""""""""""""
lua require("plugins")
lua require("lsp")
