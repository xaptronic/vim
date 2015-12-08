execute pathogen#infect()

filetype plugin indent on
syntax enable
colorscheme monokai

let mapleader = ";"

set statusline=[%{getcwd()}]\ 
set statusline+=%t\ 
set statusline+=%y
set statusline+=[%{strlen(&fenc)?&fenc:'none'},%{&ff}]
set statusline+=%h
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*
set statusline+=%r
set statusline+=%=
set statusline+=%c,%l/%L\ %P
set statusline+=\ %{StatuslineCurrentHighlight()}

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

if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= ' '
      let s .= i
      let s .= ' %*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let bufnr = buflist[winnr - 1]
      let file = bufname(bufnr)
      let buftype = getbufvar(bufnr, 'buftype')
      if buftype == 'nofile'
        if file =~ '\/.'
          let file = substitute(file, '.*\/\ze.', '', '')
        endif
      else
        let file = fnamemodify(file, ':p:t')
      endif
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let s .= ' '
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
endif
nnoremap <leader>c :bd<cr>
