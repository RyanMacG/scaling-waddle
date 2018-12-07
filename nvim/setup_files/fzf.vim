" FZF config
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><leader> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>. :Lines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>: :Commands<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Rg ' . input('Rg/')<CR>
  nnoremap <silent> K :call SearchWordWithRg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithRg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>

  " lets make it railsy
  nnoremap <silent> <leader>ja :Files app/assets<CR>
  nnoremap <silent> <leader>jm :Files app/models<CR>
  nnoremap <silent> <leader>jc :Files app/controllers<CR>
  nnoremap <silent> <leader>jv :Files app/views<CR>
  nnoremap <silent> <leader>jh :Files app/helpers<CR>
  nnoremap <silent> <leader>jM :Files app/mailers<CR>
  nnoremap <silent> <leader>jS :Figes app/services<CR>
  nnoremap <silent> <leader>jJ :Files app/jobs<CR>
  nnoremap <silent> <leader>jL :Files app/lib<CR>
  nnoremap <silent> <leader>jl :Files lib<CR>
  nnoremap <silent> <leader>jp :Files public<CR>
  nnoremap <silent> <leader>js :Files spec<CR>
  nnoremap <silent> <leader>jf :Files spec/factories<CR>
  nnoremap <silent> <leader>jd :Files db<CR>
  nnoremap <silent> <leader>jC :Files config<CR>
  nnoremap <silent> <leader>jV :Files vendor<CR>

  imap <C-x><C-l> <plug>(fzf-complete-line)
" }}}

nnoremap <leader>rg :Rg <CR>

function! SearchWordWithRg()
  execute 'Rg' expand('<cword>')
endfunction

function! SearchVisualSelectionWithRg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Rg' selection
endfunction

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

  " Overriding fzf.vim's default :Files command.
  " Pass zero or one args to Files command (which are then passed to Fzf_dev). Support file path completion too.
  command! -nargs=? -complete=file Files call Fzf_dev(<q-args>)

  nnoremap <silent> <leader>e :Files<CR>

endif

" Files + devicons
function! Fzf_dev(qargs)
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'" --expect=ctrl-t,ctrl-v,ctrl-x --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all'

  function! s:files(dir)
    let l:cmd = $FZF_DEFAULT_COMMAND
    if a:dir != ''
      let l:cmd .= ' ' . shellescape(a:dir)
    endif
    let l:files = split(system(l:cmd), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(lines)
    if len(a:lines) < 2 | return | endif

    let l:cmd = get({'ctrl-x': 'split',
                 \ 'ctrl-v': 'vertical split',
                 \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

    for l:item in a:lines[1:]
      let l:pos = stridx(l:item, ' ')
      let l:file_path = l:item[pos+1:-1]
      execute 'silent '. l:cmd . ' ' . l:file_path
    endfor
  endfunction

  call fzf#run({
        \ 'source': <sid>files(a:qargs),
        \ 'sink*':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction
