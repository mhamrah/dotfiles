" Vim color file
"
" Author: Michael Hamrah
"

hi clear

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="hammer"

hi Normal	guifg=#E5E5E5 guibg=#15191E
hi Comment	guifg=#888888
hi Statement	guifg=#bbedfc gui=none
hi Type		guifg=#d2d7fc gui=none
hi PreProc	guifg=#ffd979
hi Define	guifg=#72929c"#ffd976
hi Identifier	guifg=#d89292
hi Function guifg=#bbedfc
hi Constant	guifg=#91b8c4
hi Special	guifg=#d2d7fc "#eb7752"#9bcc93
hi String	guifg=#ffe39b
hi Keyword	guifg=#Bae8Bd
hi Number	guifg=#d89292
hi Delimiter guifg=#ffc124
hi NonText	guifg=#565656
hi Title	guifg=#6b987a

"NERDTree
hi Directory	guifg=#a6e5bb
hi NerdTreeDirSlash guifg=#6b987a
hi NERDTreePart guifg=#bbedfc
"hi treePart	guifg=#b5d5a5 

"Special
hi Search guifg=#343334 guibg=#e3e8ed
hi LineNr	guifg=#5e5e5e guibg=#090b0d
"ruby

