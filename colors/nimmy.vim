" -----------------------------------------------------------------------------
" File:         nimmy.vim
" Description:  Retro pastel colorscheme inspired by Gruvbox
" License:      GPL-2.0
" -----------------------------------------------------------------------------

hi clear
if exists("syntax_on") | syntax reset | endif
let g:colors_name = "nimmy"

let s:contrast = get(g:, 'nimmy_contrast', 'medium')

if s:contrast == 'hard'
  let s:bg0 = "#1d2021" | let s:fg0 = "#fbf1c7"
elseif s:contrast == 'soft'
  let s:bg0 = "#32302f" | let s:fg0 = "#d5c4a1"
elseif s:contrast == 'light'
  let s:bg0 = "#fbf1c7" | let s:fg0 = "#3c3836"
  set background=light
else
  let s:bg0 = "#282828" | let s:fg0 = "#ebdbb2"
  set background=dark
endif

" Shared colors
let s:bg1 = "#3c3836"
let s:gray = "#928374"
let s:pink = "#ce9178"
let s:aqua = "#89b482"
let s:yellow = "#d79921"
let s:purple = "#d3869b"
let s:blue = "#7daea3"

function! s:hi(group, fg, bg, attr)
  let l:cmd = "hi " . a:group
  if a:fg != "" | let l:cmd .= " guifg=" . a:fg | endif
  if a:bg != "" | let l:cmd .= " guibg=" . a:bg | endif
  if a:attr != "" | let l:cmd .= " gui=" . a:attr | endif
  execute l:cmd
endfunction

call s:hi("Normal", s:fg0, s:bg0, "none")
call s:hi("Comment", s:gray, "", "italic")
call s:hi("Statement", s:pink, "", "bold")
call s:hi("String", s:aqua, "", "none")
call s:hi("Function", s:yellow, "", "none")
call s:hi("Constant", s:purple, "", "none")
call s:hi("Identifier", s:blue, "", "none")


" --- C / C++ ---
call s:hi("cCustomClass", s:yellow, "", "none")
call s:hi("cType", s:blue, "", "none")
call s:hi("cStorageClass", s:pink, "", "bold")
call s:hi("cppStructure", s:pink, "", "bold")
call s:hi("cppModifier", s:pink, "", "bold")
call s:hi("cppOperator", s:aqua, "", "none")

" --- Rust ---
call s:hi("rustMacro", s:yellow, "", "bold")
call s:hi("rustModPath", s:fg0, "", "none")
call s:hi("rustAttribute", s:blue, "", "italic")
call s:hi("rustKeyword", s:pink, "", "bold")
call s:hi("rustType", s:blue, "", "none")
call s:hi("rustEnumVariant", s:yellow, "", "none")

" --- JavaScript / TypeScript ---
call s:hi("javaScriptIdentifier", s:blue, "", "none")
call s:hi("javaScriptFunction", s:pink, "", "bold")
call s:hi("jsObjectProp", s:yellow, "", "none")
call s:hi("typescriptReserved", s:pink, "", "bold")
call s:hi("typescriptLabel", s:yellow, "", "none")
call s:hi("typescriptArrowFunc", s:pink, "", "none")
call s:hi("typescriptXHRMethod", s:aqua, "", "bold")

" --- Make ---
call s:hi("makeTarget", s:yellow, "", "bold")
call s:hi("makeCommands", s:fg0, "", "none")
call s:hi("makeSpecial", s:pink, "", "none")

" --- TreeSitter (Neovim Modern) ---
hi! link @variable Identifier
hi! link @function Function
hi! link @keyword Statement
hi! link @operator Operator
hi! link @type Type
hi! link @string String
hi! link @constant Constant
hi! link @parameter Identifier