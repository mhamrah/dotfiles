set background=dark

highlight clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name="hammer"

" COMMON COLORS AND SETTINGS
highlight PreProc       guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight Function      guifg=#e8e4de guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
highlight Identifier    guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
highlight Statement     guifg=#76a0b5 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight Constant      guifg=#af8787 guibg=NONE gui=NONE ctermfg=138 ctermbg=NONE cterm=NONE
highlight Type          guifg=#97b7c7 guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight Label         guifg=#e6e9ec guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight Special       guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight Operator      guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight Title         guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight Conditional   guifg=#a9bab2 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight StorageClass  guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
highlight htmlStatement guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight htmlItalic    guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight htmlArg       guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
highlight cssIdentifier guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight cssClassName  guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight Structure     guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
highlight Typedef       guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
highlight Repeat        guifg=#dcdcdc guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight Keyword       guifg=#a9b3bc guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight Exception     guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
highlight Number        guifg=#e6e9ec guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
highlight Character     guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
highlight Boolean       guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
highlight Float         guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=130 ctermbg=NONE cterm=NONE
highlight Include       guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight Define        guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight Comment       guifg=#666666 guibg=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE

"WINDOW UI
highlight MoreMsg           guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight VimCommentTitle   guifg=#bfb5b2 guibg=NONE gui=reverse ctermfg=101 ctermbg=NONE cterm=reverse
highlight SpecialComment    guifg=#bfb5b2 guibg=NONE gui=reverse ctermfg=101 ctermbg=NONE cterm=reverse
highlight Underlined        guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight Todo              guifg=#bfb5b2 guibg=NONE gui=reverse ctermfg=130 ctermbg=NONE cterm=reverse
highlight Visual            guifg=#343434 guibg=#bfb5b2 gui=NONE ctermfg=187 ctermbg=95 cterm=NONE
highlight Question          guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
highlight Search            guifg=#343434 guibg=#bfb5b2 gui=NONE ctermfg=187 ctermbg=95 cterm=NONE
highlight MatchParen        guifg=#bfb5b2 guibg=NONE gui=reverse ctermfg=102 ctermbg=NONE cterm=reverse
highlight Error             guifg=#bfb5b2 guibg=#262626 gui=reverse ctermfg=131 ctermbg=233 cterm=reverse
highlight ErrorMsg          guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight WarningMsg        guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight Directory         guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=131 ctermbg=NONE cterm=NONE
highlight Cursor            guifg=#343434 guibg=#bfb5b2 gui=NONE ctermfg=16 ctermbg=187 cterm=NONE
highlight CursorLineNR      guifg=#bfb5b2 guibg=NONE gui=reverse ctermfg=102 ctermbg=NONE cterm=reverse
highlight WildMenu          guifg=#343434 guibg=#bfb5b2 gui=NONE ctermfg=187 ctermbg=95 cterm=NONE
highlight ModeMsg           guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=187 ctermbg=NONE cterm=NONE
highlight Macro             guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight PreCondit         guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight IncSearch         guifg=#bfb5b2 guibg=NONE gui=reverse ctermfg=131 ctermbg=NONE cterm=reverse
highlight VisualNOS         guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline

"DIFF
highlight DiffAdd           guifg=#008787 guibg=NONE gui=reverse ctermfg=30 ctermbg=NONE cterm=reverse
highlight DiffText          guifg=#008787 guibg=NONE gui=reverse ctermfg=30 ctermbg=NONE cterm=reverse
highlight DiffChange        guifg=#005f5f guibg=NONE gui=reverse ctermfg=23 ctermbg=NONE cterm=reverse
highlight DiffDelete        guifg=#bfb5b2 guibg=NONE gui=reverse ctermfg=131 ctermbg=NONE cterm=reverse

"SPELLING
highlight SpellBad          guifg=#ff0000 guibg=NONE gui=undercurl ctermfg=196 ctermbg=NONE cterm=undercurl
highlight SpellLocal        guifg=#5f875f guibg=NONE gui=undercurl ctermfg=65 ctermbg=NONE cterm=undercurl
highlight SpellCap          guifg=#87afff guibg=NONE gui=undercurl ctermfg=112 ctermbg=NONE cterm=undercurl
highlight SpellRare         guifg=#d75f00 guibg=NONE gui=undercurl ctermfg=166 ctermbg=NONE cterm=undercurl

"COLORS
highlight Normal            guifg=#d8d0c4 guibg=#2A2E36 gui=NONE ctermfg=187 ctermbg=234 cterm=NONE
"highlight Normal            guifg=#cbd6d5 guibg=#272c33 gui=NONE ctermfg=187 ctermbg=234 cterm=NONE
highlight String            guifg=#c79797 guibg=NONE gui=NONE ctermfg=222 ctermbg=235 cterm=NONE

"WINDOW UI
highlight StatusLine        guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=247 ctermbg=235 cterm=NONE
highlight StatusLineNC      guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=242 ctermbg=235 cterm=NONE
highlight StatusLineTerm    guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=247 ctermbg=235 cterm=NONE
highlight StatusLineTermNC  guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=242 ctermbg=235 cterm=NONE
highlight Pmenu             guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=241 ctermbg=235 cterm=NONE
highlight PmenuSel          guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=187 ctermbg=235 cterm=NONE
highlight PmenuSbar         guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=235 ctermbg=235 cterm=NONE
highlight PmenuThumb        guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=235 ctermbg=235 cterm=NONE
highlight TabLine           guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=242 ctermbg=235 cterm=NONE
highlight TabLineSel        guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=247 ctermbg=235 cterm=NONE
highlight TabLineFill       guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=242 ctermbg=235 cterm=NONE
highlight CursorLine        guifg=NONE guibg=#141414 gui=NONE ctermfg=NONE ctermbg=233 cterm=NONE
highlight CursorColumn      guifg=NONE guibg=#141414 gui=NONE ctermfg=NONE ctermbg=233 cterm=NONE
highlight ColorColumn       guifg=NONE guibg=#141414 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
highlight Folded            guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=238 ctermbg=233 cterm=NONE
highlight VertSplit         guifg=#4a4a4a guibg=#141414 gui=NONE ctermfg=238 ctermbg=234 cterm=NONE
highlight LineNr            guifg=#4a4a4a guibg=#25252E gui=NONE ctermfg=238 ctermbg=233 cterm=NONE
highlight FoldColumn        guifg=#4a4a4a guibg=#232323 gui=NONE ctermfg=109 ctermbg=234 cterm=NONE
highlight SignColumn        guifg=#4a4a4a guibg=#080808 gui=NONE ctermfg=101 ctermbg=233 cterm=NONE
highlight NonText           guifg=#4a4a4a guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE
highlight SpecialKey        guifg=#4a4a4a guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE

" Go
highlight goExtraType       guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE
highlight goReceiverType    guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE

" vim
highlight vimHiGuiFgBg      guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE
highlight vimHiCtermFgBg    guifg=#bfb5b2 guibg=NONE gui=NONE ctermfg=236 ctermbg=NONE cterm=NONE
