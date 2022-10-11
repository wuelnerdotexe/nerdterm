" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     nerdterm.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  MIT (C) Wuelner Martínez.
" About:    A term toggle plugin for vim.
" -----------------------------------------------------------------------------

command NERDTermToggle call nerdterm#Toggle()

map <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>
tmap <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>

