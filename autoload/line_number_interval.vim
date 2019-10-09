function! line_number_interval#enable() abort
    let s:ui_type = ['gui', 'cterm']
    let s:fg_bg = ['fg', 'bg']

    let s:linenr_color = {}
    for l:type in s:ui_type
        let s:linenr_color[l:type] = {}
        for l:fb in s:fg_bg
            let s:linenr_color[l:type][l:fb] = synIDattr(synIDtrans(hlID('LineNr')), l:fb, l:type)
            if s:linenr_color[l:type][l:fb] ==# ''
                let s:linenr_color[l:type][l:fb] = 'NONE'
            endif
        endfor
    endfor

    if hlID('DimLineNr') == 0
        execute 'highlight DimLineNr'
            \ 'guifg='   s:linenr_color.gui.bg   'guibg='   s:linenr_color.gui.bg
            \ 'ctermfg=' s:linenr_color.cterm.bg 'ctermbg=' s:linenr_color.cterm.bg
    endif

    let s:dim_linenr_color = {}
    for l:type in s:ui_type
        let s:dim_linenr_color[l:type] = {}
        for l:fb in s:fg_bg
            let s:dim_linenr_color[l:type][l:fb] = synIDattr(synIDtrans(hlID('DimLineNr')), l:fb, l:type)
            if s:dim_linenr_color[l:type][l:fb] ==# ''
                let s:dim_linenr_color[l:type][l:fb] = 'NONE'
            endif
        endfor
    endfor

    if hlID('HighlightedLineNr') == 0
        execute 'highlight HighlightedLineNr'
            \ 'guifg='   s:linenr_color.gui.fg   'guibg='   s:linenr_color.gui.bg
            \ 'ctermfg=' s:linenr_color.cterm.fg 'ctermbg=' s:linenr_color.cterm.bg
    endif

    execute 'highlight LineNr'
        \ 'guifg='   s:dim_linenr_color.gui.fg   'guibg='   s:dim_linenr_color.gui.bg
        \ 'ctermfg=' s:dim_linenr_color.cterm.fg 'ctermbg=' s:dim_linenr_color.cterm.bg

    call sign_define('LineNumberInterval', {
        \ 'numhl': 'HighlightedLineNr'
        \ })

    augroup LineNumberInterval
        autocmd!
        autocmd BufRead,BufNewFile,CursorMoved,CursorMovedI * call line_number_interval#update()
    augroup END

    call line_number_interval#update()
    redraw

    let s:enabled_line_number_interval = 1
endfunction

function! line_number_interval#disable() abort
    augroup LineNumberInterval
        autocmd!
    augroup END

    call sign_unplace('LineNumberGroup', {'buffer': bufname('%')})
    call sign_undefine('LineNumberInterval')

    execute 'highlight LineNr'
        \ 'guifg='   s:linenr_color.gui.fg   'guibg='   s:linenr_color.gui.bg
        \ 'ctermfg=' s:linenr_color.cterm.fg 'ctermbg=' s:linenr_color.cterm.bg

    let s:enabled_line_number_interval = 0
endfunction

function! line_number_interval#toggle() abort
    if exists('s:enabled_line_number_interval') && s:enabled_line_number_interval
        call line_number_interval#disable()
    else
        call line_number_interval#enable()
    endif
endfunction

function! line_number_interval#update() abort
    call sign_unplace('LineNumberGroup', {'buffer': bufname('%')})

    if &relativenumber
        let s:lnum = line('.') - 1
        let s:numfold = 0
        while s:lnum >= line('w0')
            let s:numfolddelta = 0
            if foldclosed(s:lnum) != -1
                let s:numfolddelta = s:lnum - foldclosed(s:lnum)
                let s:numfold += s:numfolddelta
            endif
            if (line('.') - s:lnum - s:numfold) % g:line_number_interval == 0
                call sign_place('', 'LineNumberGroup', 'LineNumberInterval', bufname('%'), {'lnum': s:lnum})
            endif
            let s:lnum -= 1 + s:numfolddelta
        endwhile

        let s:lnum = line('.') + 1
        if foldclosed(line('.')) != -1
            let s:numfold = 1
        else
            let s:numfold = 0
        endif
        while s:lnum <= line('w$')
            let s:numfolddelta = 0
            if foldclosedend(s:lnum) != -1
                let s:numfolddelta = foldclosedend(s:lnum) - s:lnum
                let s:numfold += s:numfolddelta
            endif
            if (s:lnum - line('.') - s:numfold) % g:line_number_interval == 0
                call sign_place('', 'LineNumberGroup', 'LineNumberInterval', bufname('%'), {'lnum': s:lnum})
            endif
            let s:lnum += 1 + s:numfolddelta
        endwhile

    elseif &number
        let s:lnum = line('w0')
        while s:lnum <= line('w$')
            if s:lnum % g:line_number_interval == 0 && s:lnum != line('.')
                call sign_place('', 'LineNumberGroup', 'LineNumberInterval', bufname('%'), {'lnum': s:lnum})
            endif
            let s:lnum += 1
        endwhile

    endif
endfunction
