" Pathogen settings, which must come before file type detection
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#incubate()
call pathogen#helptags()

" General Settings
set nocompatible        " not compatible with the old-fashion vi mode
set autoread            " auto read when file is changed from outside
set backspace=2         " allow backspacing over everything in insert mode
set history=100         " keep 100 lines of command line history
set nowrap              " no wrap
set number              " list the # of line
set ruler               " show the cursor position all the time

" set list listchars=eol:$,tab:>.,trail:~,extends:>,precedes:<
set list listchars=tab:>.,trail:~,extends:>,precedes:<

" set tagpage
set tabpagemax=18       " default is 10
set showtabline=1       " 0: do not show tab, 1: show tab when create, 2: always show tab

" short the tabpage naming
function! ShortTabLabel ()
    let bufnrlist = tabpagebuflist (v:lnum)
    let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction
set guitablabel=%{ShortTabLabel()}


filetype on             " enable filetype detection
"filetype indent on      " enable filetype-specific indenting
filetype plugin on      " enalbe filetype-specific plugins


" auto reload vimrc when editing it
"au! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc


syntax on               " syntax highlight
set hlsearch            " search highlight


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


if has("gui_running")   " GUI color and font settings
    set t_Co=256        " 256 color mode
    set background=dark
    set cursorline      " highlight current line, (set cul; set nocul)
    "set cursorcolumn    " highlight current column, (set cuc; set nocuc)
    highlight CursorLine guibg=#003853 ctermbg=24 gui=none cterm=none
    "colors desert
    "colors torte
    "colors molokai
    colors solarized
elseif (version >= 7)
    set t_Co=256
    set background=dark
    set cursorline
    "set cursorcolumn
    highlight CursorLine guibg=#003853 ctermbg=24 gui=none cterm=none
    "colors desert
    "colors torte
    colors molokai
    "colors solarized
endif


" Control whether various GUI widgets are shown
set guioptions-=m       " remove menu bar
set guioptions-=T       " remove toolbar
set guioptions-=r       " remove right-hand scroll bar
set guioptions-=L       " remove left-hand scroll bar


" folding
"set foldcolumn=4
"highlight Folded guifg=#465457 guibg=#000000 ctermfg=darkcyan ctermbg=black
"highlight FoldColumn guifg=#465457 guibg=#000000 ctermfg=darkcyan ctermbg=black


set clipboard=unnamed   " yank to the system register (*) by default
set showmatch           " cursor shows matching ) and }
set showmode            " show current mode
set wildchar=<TAB>      " start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu
" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc


set autoindent          " auto indentation
set smartindent
set copyindent          " copy the previous indentation on autoindenting
set incsearch           " incremental search
set nobackup            " no *~ backup files
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to context


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


" C/C++ specific settings
autocmd FileType c,cpp,cc set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30


" Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup


" ===========================================================================
" Insert mode command
" ===========================================================================
" map ,mo (verilog module)
autocmd FileType verilog map!
    \,mo 
    \module (<CR>
    \);<CR>
    \endmodule<ESC>O

" map ,ac (verilog always combinational block)
autocmd FileType verilog map!
    \,ac 
    \always @ (*) begin: ac_<CR>
    \end // ac_<ESC>kO

" map ,as (verilog always sequential block)
autocmd FileType verilog map!
    \,as 
    \always @ (posedge sysclk or negedge reset_n) begin: as_<CR>
    \<Tab>if (~reset_n) begin<CR>
    \<BS>end else begin<CR>
    \end<CR>
    \<BS>end // as_<ESC>kkkkO
