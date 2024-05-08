set number
noremap ; l
noremap l k
noremap k j
noremap j h
:imap ii <Esc> 
syntax on

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-up> :call <SID>swap_up()<CR>
noremap <silent> <c-down> :call <SID>swap_down()<CR>

:set shiftwidth=2
:set autoindent
:set smartindent
:set tabstop=2
