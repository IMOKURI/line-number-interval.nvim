if exists('g:loaded_line_number_interval') || !has('nvim-0.3.2')
    finish
endif
let g:loaded_line_number_interval = 1

if !exists('g:line_number_interval')
    let g:line_number_interval = 10
endif

if get(g:, 'line_number_interval#enable', 0)
    augroup LineNumberInterval
        autocmd!
        autocmd BufRead,BufNewFile,CursorMoved,CursorMovedI * call line_number_interval#update()
    augroup END
endif
