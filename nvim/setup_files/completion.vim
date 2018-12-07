" Deoplete
" {{{
  let g:deoplete#enable_at_startup = 1
" }}}

let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> M :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
