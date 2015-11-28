execute pathogen#infect()

filetype plugin indent on
syntax on

set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set scrolloff=5
set encoding=utf-8
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set novisualbell
if has("cursorline")
    set cursorline
endif
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
" close buffers when closing tabs
set nohidden
if exists("+relativenumber")
     set relativenumber
else
	set number
endif
"set undofile
set pastetoggle=<F2>
if has("mouse")
set mouse=a
endif
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set wildignore+=.git

" x deletes text by putting it into the blackhole register _ 
noremap x "_x 
noremap X "_X 
  
" cut/copy and paste (read: dont yank on paste) 
vnoremap p "_xP 
   
" cut/copy paste from clipboard 
vnoremap <leader>y "+y 
nnoremap <leader>p "+p 
vnoremap <leader>p "+p 
nnoremap <leader>P "+P 
    
" text formatting 
vnoremap < <gv 
vnoremap > >gv 
vnoremap <leader>t :Tabularize/ 
     
" close all buffers 
nnoremap <leader>q :bufdo bd<cr> 
nnoremap <leader>c :bd<cr>
