let s:linenr_bg = synIDattr(synIDtrans(hlID('LineNr')), 'bg')
let s:linenr_fg = synIDattr(synIDtrans(hlID('LineNr')), 'fg')

execute 'highlight LineNr guifg=' s:linenr_bg 'guibg=' s:linenr_bg
execute 'highlight LineNrVisible guifg=' s:linenr_fg 'guibg=' s:linenr_bg
