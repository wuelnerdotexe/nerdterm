" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     nerdterm.vim
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/human.vim
" License:  MIT (C) Wuelner Martínez.
" About:    A term toggle plugin for vim.
" -----------------------------------------------------------------------------

command -nargs=0 NERDTermToggle call nerdterm#toggle()

noremap <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>
noremap! <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>
tnoremap <Plug>(NERDTermToggle) <Cmd>NERDTermToggle<CR>

if !hasmapto('<Plug>(NERDTermToggle)')
	noremap <C-`> <Plug>(NERDTermToggle)
	noremap! <C-`> <Plug>(NERDTermToggle)
	tnoremap <C-`> <Plug>(NERDTermToggle)
endif
