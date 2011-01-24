" Vim color file
"
" Author: Michael Hamrah
"

hi clear

set background=dark

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name="hammer"

hi Normal	guifg=#E5E5E5 guibg=#15191E
hi Comment	guifg=#888888
hi Statement	guifg=#bbedfc gui=none
hi Type		guifg=#d2d7fc gui=none
hi PreProc	guifg=#ffd979
hi Define	guifg=#ffd976
hi Identifier	guifg=#72929c
hi Constant	guifg=#91b8c4
hi LineNr	guifg=#5e5e5e guibg=#090b0d
hi Special	guifg=#9bcc93
hi String	guifg=#9bcc93 "#90ff91 "#c25353
hi Keyword	guifg=#Bae8Bd
hi NonText	guifg=#565656
hi Directory	guifg=#6b987a
hi Title	guifg=#a6e5bb
hi treePart	guifg=#b5d5a5 
hi Number	guifg=#ffd976
