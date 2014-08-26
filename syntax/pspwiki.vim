" =================================================
" Realtek PSP Wiki syntax file
" 
" Usage:       $ cp pspwiki.vim $HOME/.vim/syntax/
"
" Language:    Realtek PSP Report Files
" Maintainer:  Shun-Yen Lu <shunyen@realtek.com>
" Last Change: 2014 Aug 26
" =================================================

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif


syntax match Comment "^#.*$"
syntax match Comment "^-.*$"
syntax match Title "^\s*==[^=]\+==\s*$"
syntax match Keyword "^\s*'''[^']\+'''\s*$"
syntax match Identifier "^\s*\*\s\+.*$"
"syntax match Identifier "^\s*\*\*\s\+.*$"
"syntax region Identifier start=+^\s*\*\*\s+ end=+$+ contains=Define keepend
syntax match Error "^\s*\*\*\*\*.*$"
syntax match Define "\w\+:\s"
syntax match Define "{{[^{}]\+}}"

let b:current_syntax = "pspwiki"
