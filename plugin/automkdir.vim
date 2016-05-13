"=============================================================================
" FILE: plugin/automkdir.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
if expand('%:p') ==# expand('<sfile>:p')
  unlet! g:loaded_automkdir
endif
if exists('g:loaded_automkdir')
  finish
endif
let g:loaded_automkdir = 1
let s:save_cpo = &cpo
set cpo&vim

augroup automkdir
    autocmd!
    autocmd BufWritePre * call automkdir#mkdir(expand('<afile>:p:h'), v:cmdbang)
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
