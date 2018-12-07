" Startify
" {{{
  let g:startify_session_dir = '~/.nvim/session'
  let g:startify_list_order = ['sessions']
  let g:startify_session_persistence = 1
  let g:startify_session_delete_buffers = 1
  let g:startify_change_to_dir = 1
  let g:startify_change_to_vcs_root = 1
  nnoremap <F12> :Startify<CR>
  autocmd! User Startified setlocal colorcolumn=0
" }}}

" Delimit Mate
" {{{
  let delimitMate_expand_cr = 2
  let delimitMate_expand_space = 1 " {|} => { | }
" }}}

" Switch.vim
" {{{
  let g:switch_mapping = '\'
" }}}

" Quick way to save file
nnoremap <leader>w :w<CR>

" Indent guides
" {{{
  let g:indent_guides_default_mapping = 0
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']
" }}}

" Terminal {{{
" ====================================================================
nnoremap <silent> <leader><Enter> :tabnew<CR>:terminal<CR>
nnoremap <leader>o :below 10sp term://$SHELL<cr>

" Opening splits with terminal in all directions
nnoremap <Leader>h<Enter> :leftabove  vnew<CR>:terminal<CR>
nnoremap <Leader>l<Enter> :rightbelow vnew<CR>:terminal<CR>
nnoremap <Leader>k<Enter> :leftabove  new<CR>:terminal<CR>
nnoremap <Leader>j<Enter> :rightbelow new<CR>:terminal<CR>

tnoremap <F1> <C-\><C-n>
tnoremap <C-\><C-\> <C-\><C-n>:bd!<CR>

function! TerminalInSplit(args)
  botright split
  execute 'terminal' a:args
endfunction

nnoremap <leader><F1> :execute 'terminal ranger ' . expand('%:p:h')<CR>
nnoremap <leader><F2> :terminal ranger<CR>
augroup terminalSettings
  autocmd!
  autocmd FileType ruby nnoremap <leader>\ :call TerminalInSplit('rails c')<CR>
augroup END

" NeoMRU
" {{{
  let g:neomru#file_mru_path = '~/.config/nvim/cache/neomru/file'
  let g:neomru#directory_mru_path = '~/.config/nvim/cache/neomru/directory'
" }}}

" Junkfile
" {{{
  nnoremap <leader>jo :JunkfileOpen<CR>
  let g:junkfile#directory = '~/.config/nvim/cache/junkfile'
" }}}

" Peekaboo
" {{{
  let g:peekaboo_delay = 400
" }}}

" Undotree
" {{{
  " Auto create undodir if not exists
  let undodir = expand('~/.config/.nvim/undodir')
  if !isdirectory(undodir)
    call mkdir(undodir, 'p')
  endif
  let &undodir = undodir

  nnoremap <leader>ut :UndotreeToggle<CR>
" }}}

" Ale
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1
