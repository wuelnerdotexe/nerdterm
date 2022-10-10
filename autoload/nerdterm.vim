" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     nerdterm.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  MIT (C) Wuelner Martínez.
" About:    A term toggle plugin for vim.
" -----------------------------------------------------------------------------

function! s:SetOptions() abort
  setlocal filetype=nerdterm
  setlocal nobuflisted
  setlocal signcolumn=no
  setlocal nospell
  setlocal nonumber
  setlocal norelativenumber
  setlocal noruler
  setlocal nocursorline
  setlocal colorcolumn=
  setlocal nolist
endfunction

function! s:RemoveEmptyBuffers() abort
  let l:buffers = filter(range(1, bufnr('$')),
        \ 'buflisted(v:val)'.
        \   ' && empty(bufname(v:val))'.
        \   ' && bufwinnr(v:val)<0'.
        \   ' && !getbufvar(v:val, "&mod")')

  if !empty(l:buffers)
    silent! execute 'bwipeout ' . join(l:buffers, ' ')
  endif
endfunction

function! s:CreateTerm() abort
  if has('nvim')
    call termopen($SHELL)
  else
    terminal ++curwin
  endif

  let s:terminfo.buffer_id = bufnr('')

  call <SID>SetOptions()
endfunction

function! s:OpenTerm() abort
  execute 'botright' . float2nr(&lines * 0.25) . 'new'

  let s:terminfo.win_id = win_getid()

  try
    execute 'buffer' s:terminfo.buffer_id
  catch
    call <SID>CreateTerm()
  endtry

  call <SID>RemoveEmptyBuffers()

  let s:terminfo.state = 'opened'

  startinsert!
endfunction

function! s:CloseTerm() abort
  if win_gotoid(s:terminfo.win_id)
    let s:terminfo.win_id = win_getid()

    hide

    call <SID>RemoveEmptyBuffers()
  endif

  let s:terminfo.state = 'closed'
endfunction

function! nerdterm#Toggle() abort
  if !exists('s:terminfo') || bufnr(s:terminfo.buffer_id) == -1
    let s:terminfo = { 'win_id': -1, 'buffer_id': -1, 'state': 'closed' }
  elseif getbufinfo(s:terminfo.buffer_id)[0].windows == []
    let s:terminfo.state = 'closed'
  endif

  if s:terminfo.state == 'opened'
    call <SID>CloseTerm()
  elseif s:terminfo.state == 'closed'
    call <SID>OpenTerm()
  endif
endfunction
