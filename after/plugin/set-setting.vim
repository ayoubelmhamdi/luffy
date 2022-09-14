" fold
" set foldmethod=marker
" set fillchars=fold:\ 

"set scrolloff=99
"set sidescrolloff=99
set linebreak
set path+=**
set whichwrap=b,s,<,>,h,l,[,]
set nojoinspaces 
set linespace=5
" -- Make substitution work in realtime
" set clipboard+=unnamedplus
set clipboard^=unnamed
set inccommand=split 


set nowrap
set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set backspace=indent,eol,start
" set colorcolumn=110
set showtabline=2
"set cursorline

set mouse=a
set updatetime=300
set wildignore+=*.o,*.obj,.git,*.pyc


set noswapfile nowritebackup undofile nobackup
set backupdir=/tmp/nvim/backup
set undodir+=/tmp/nvim/undodir

set autoread autowrite
set ignorecase smartcase
" set list listchars=eol:⏎

set cmdheight=1

set nohlsearch
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
augroup END

" Disabled Now: 
"     set foldmethod=manual
"     set formatprg=prettier
"     set incsearch
"     set linebreak
"     set nohlsearch
"     set showtabline=2



""""set complete+=kspell
""""set formatoptions=cro
""""set go=a
""""set laststatus=2
""""set matchpairs+=<:> "TODO: use filetype 
""""set mmp=5000
""""set modelines=2
""""set noerrorbells visualbell t_vb=
""""set noshiftround
""""set nospell
""""set nostartofline
""""set pumheight=10
""""set regexpengine=1
""""set ruler
""""set shortmess+=c
""""set showcmd
""""set showmatch
""""set showmode
""""set spelllang=en_us
""""set timeoutlen=900
""""set ttimeout
""""set ttimeoutlen=0
""""set wildmenu
""""set wildmode=longest,list,full
""""set virtualedit=block




"""""tow line for schow error
""""" set endofline
""""" set list
""""" set listchars=tab:>-,eol:¶
""""" set listchars=tab:>.,trail:.,precedes:<,extends:>
""""" set tw=0
""""" set wm=0
""""" using only 1 column (and 1 space) while possible
""""" set numberwidth=1
""""" set nolazyredraw

" set textwidth=60
