if exists('g:loaded_line_number_interval') || !has('nvim-0.3.2')
    finish
endif
let g:loaded_line_number_interval = 1

if !exists('g:line_number_interval')
    let g:line_number_interval = 10
endif

if get(g:, 'line_number_interval#enable', 0)
    call line_number_interval#enable()
endif

command! LineNumberIntervalEnable call line_number_interval#enable()
command! LineNumberIntervalDisable call line_number_interval#disable()
command! LineNumberIntervalToggle call line_number_interval#toggle()
