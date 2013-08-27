" Configuration file for vim
set modelines=0     " CVE-2007-2438

" General Settings
set nocompatible    " not compatible with the old-fashion vi mode
set autoread        " auto read when file is changed from outside
set backspace=2     " allow backspacing over everything in insert mode
set history=100     " keep 100 lines of command line history
set nowrap          " no wrap
set number          " list the # of line
set ruler           " show the cursor position all the time

" set list listchars=eol:$,tab:>.,trail:~,extends:>,precedes:<
set list listchars=tab:>.,trail:~,extends:>,precedes:<

" short the tab naming
function ShortTabLabel ()
    let bufnrlist = tabpagebuflist (v:lnum)
    let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction
set guitablabel=%{ShortTabLabel()}


filetype on         " enable filetype detection
"filetype indent on  " enable filetype-specific indenting
filetype plugin on  " enalbe filetype-specific plugins


" auto reload vimrc when editing it
"au! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc


syntax on           " syntax highlight
set hlsearch        " search highlight


" set fonts
"set guifont=Monaco\ 16
"set guifont=Monaco:h16
"set gfn=MONACO:h16
"set gfn=Consolas:h16
"set gfn=DejaVu\ Sans\ Mono:h16
"set gfn=Droid\ Sans\ Mono:h16
"set gfn=Inconsolata:h16
set gfn=MONACO:h16
"set gfn=Osaka-Mono:h16


if has("gui_running")       " GUI color and font settings
    set t_Co=256            " 256 color mode
    set background=dark
    set cursorline          " highlight current line
    highlight CursorLine guibg=#003853 ctermbg=24 gui=none cterm=none
    "colors darkblue
    "colors desert
    colors torte
elseif (version >= 7)
    set t_Co=256
    set background=dark
    set cursorline
    highlight CursorLine guibg=#003853 ctermbg=24 gui=none cterm=none
    "colors darkblue
    "colors desert
    colors torte
endif


set clipboard=unnamed  " yank to the system register (*) by default
set showmatch          " cursor shows matching ) and }
set showmode           " show current mode
set wildchar=<TAB>     " start wild expansion in the command line using <TAB>
set wildmenu           " wild char completion menu
" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc


set autoindent         " auto indentation
set smartindent
set copyindent         " copy the previous indentation on autoindenting
set incsearch          " incremental search
set nobackup           " no *~ backup files
set ignorecase         " ignore case when searching
set smartcase          " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab           " insert tabs on the start of a line according to context


" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" TAB settings
set expandtab           " replace <TAB> with spaces
set softtabstop=4       " pseudo-TAB, composed by 4 spaces
set shiftwidth=4
"au FileType Makefile set noexpandtab
autocmd FileType Makefile set noexpandtab


" status line
set laststatus=2


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
