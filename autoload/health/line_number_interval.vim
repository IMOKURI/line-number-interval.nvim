function! s:check_nvim_version() abort
    let l:version = matchstr(execute('version'), 'NVIM v\zs[^-]*\ze-')

    if has('nvim-0.3.2')
        call health#report_ok('Neovim version is fine. ' . l:version)
    else
        call health#report_error('Neovim version is too old... ' . l:version)
    endif
endfunction

function! health#line_number_interval#check() abort
    call health#report_start('line-number-interval.nvim')
    call s:check_nvim_version()
endfunction
