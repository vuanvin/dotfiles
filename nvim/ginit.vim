" Enable Mouse
set mouse=a

let s:fontsize = 7
let s:fontfamily = "JetBrainsMono NF"

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    :execute "GuiFont! ". s:fontfamily . ":h" . s:fontsize
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> <CMD>call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc><CMD>call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> <CMD>call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G><CMD>call GuiShowContextMenu()<CR>gv

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
    :execute "GuiFont! ". s:fontfamily . ":h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> <CMD>call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> <CMD>call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc><CMD>call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc><CMD>call AdjustFontSize(-1)<CR>a
