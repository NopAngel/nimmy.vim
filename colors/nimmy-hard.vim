" =============================================================================
" File:         nimmy-hard.vim
" Description:  High-contrast pastel retro theme for systems development.
" License:      GPL-2.0
" =============================================================================

hi clear
if exists("syntax_on") | syntax reset | endif
let g:colors_name = "nimmy-hard"
set background=dark

" --- Palette ---
let s:bg0 = "#1d2021" " Hard dark background
let s:bg1 = "#3c3836" " Selection / UI background
let s:fg0 = "#fbf1c7" " Bright cream text
let s:gray = "#928374" " Muted comments

" Pastels
let s:pink   = "#ce9178" " Keywords / Logic
let s:aqua   = "#89b482" " Strings / Operators
let s:yellow = "#d79921" " Functions / Macros
let s:purple = "#d3869b" " Constants / Numbers
let s:blue   = "#7daea3" " Identifiers / Types

function! s:hi(group, fg, bg, attr)
  let l:cmd = "hi " . a:group
  if a:fg != "" | let l:cmd .= " guifg=" . a:fg | endif
  if a:bg != "" | let l:cmd .= " guibg=" . a:bg | endif
  if a:attr != "" | let l:cmd .= " gui=" . a:attr | endif
  execute l:cmd
endfunction

" --- UI & Editor ---
call s:hi("Normal", s:fg0, s:bg0, "none")
call s:hi("Comment", s:gray, "", "italic")
call s:hi("LineNr", s:gray, "", "none")
call s:hi("CursorLine", "", s:bg1, "none")
call s:hi("Search", s:bg0, s:yellow, "none")
call s:hi("Visual", "", s:bg1, "none")
call s:hi("Pmenu", s:fg0, s:bg1, "none")
call s:hi("PmenuSel", s:bg0, s:blue, "none")
call s:hi("VertSplit", s:bg1, s:bg1, "none")

" --- Syntax (General) ---
call s:hi("Statement", s:pink, "", "bold")
call s:hi("String", s:aqua, "", "none")
call s:hi("Function", s:yellow, "", "none")
call s:hi("Constant", s:purple, "", "none")
call s:hi("Identifier", s:blue, "", "none")
call s:hi("Type", s:blue, "", "none")
call s:hi("PreProc", s:pink, "", "none")

" --- Language Specific (Rust, C/C++, NASM, JS/TS) ---
call s:hi("nasmInstruction", s:pink, "", "bold")
call s:hi("nasmRegister", s:blue, "", "none")
call s:hi("rustMacro", s:yellow, "", "bold")
call s:hi("rustKeyword", s:pink, "", "bold")
call s:hi("cType", s:blue, "", "none")
call s:hi("typescriptReserved", s:pink, "", "bold")
call s:hi("makeTarget", s:yellow, "", "bold")