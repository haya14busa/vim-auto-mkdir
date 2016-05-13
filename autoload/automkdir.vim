"=============================================================================
" FILE: autoload/automkdir.vim
" AUTHOR: haya14busa
" License: MIT license
"=============================================================================
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let g:automkdir#confirm = get(g:, 'automkdir#confirm', 1)

function! automkdir#mkdir(dir, force) abort
  if s:should_mkdir(a:dir) && (a:force || !g:automkdir#confirm || s:confirm(a:dir))
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

function! s:should_mkdir(dir) abort
  return s:related_to_file(&l:buftype) && !isdirectory(a:dir)
endfunction

" :h E676
" > "acwrite" implies that the buffer name is not related to a file
function! s:related_to_file(buftype) abort
  return a:buftype is# '' || a:buftype is# 'nowrite'
endfunction

function! s:confirm(dir) abort
  return input(printf('Directory "%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$'
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
" vim: expandtab softtabstop=2 shiftwidth=2 foldmethod=marker
