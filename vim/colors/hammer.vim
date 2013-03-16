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
hi Statement	guifg=#bbedfc 
hi Type		guifg=#d2d7fc 
hi PreProc	guifg=#ffd979
hi Define	guifg=#72929c 
hi Identifier	guifg=#ecd5c2"#d89292
hi Function guifg=#bbedfc
hi Constant	guifg=#ffe39b"#91b8c4
hi Special	guifg=#d2d7fc "#eb7752"#9bcc93
hi String	guifg=#d89292"#a2d6a2"#ffe39b
hi Keyword	guifg=#Bae8Bd
hi Number	guifg=#Bae8Bd"#d89292
hi Delimiter guifg=#d8b292
hi NonText	guifg=#565656
hi Title	guifg=#ffe39b

"NERDTree
hi Directory	guifg=#a6e5bb
hi NerdTreeDirSlash guifg=#6b987a
hi NERDTreePart guifg=#bbedfc
hi NERDTreeOpenable guifg=#6b987a
"hi treePart	guifg=#b5d5a5 

"Special
hi Search guifg=#343334 guibg=#e3e8ed
hi LineNr	guifg=#5e5e5e guibg=#090b0d

"html
hi htmlTagN guifg=#72929c
hi htmlEndTag guifg=#72929c
hi htmlTag guifg=#72929c
hi htmlTagName guifg=#72929c
hi htmlSpecialTagName guifg=#72929c





