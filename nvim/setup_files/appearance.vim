colorscheme nova

" Airline config
" {{{
  let g:airline_theme='nova'
  let g:airline_left_sep  = '▓▒░'
  let g:airline_right_sep = '░▒▓'
  let g:airline_section_z = '%2p%% %2l/%L:%2v'
  let g:airline#extensions#syntastic#enabled = 0
  let g:airline#extensions#whitespace#enabled = 0
  let g:airline_exclude_preview = 1
  let g:airline_powerline_fonts = 1

  " Tabline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline#extensions#tabline#show_tabs = 0
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#tabline#fnamecollapse = 1
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#buffer_min_count = 2

  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
" }}}

" Limelight
" {{{
  nmap <silent> gl :Limelight!!<CR>
  xmap gl <Plug>(Limelight)
" }}}

" Goyo
" {{{
  nmap <silent> <leader>gg :Goyo<CR>
" }}}

" Disable search highlighting
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Make those debugger statements painfully obvious
au BufEnter * syn match error contained "\<binding.pry\>"
au BufEnter * syn match error contained "\<binding.remote_pry\>"
au BufEnter * syn match error contained "\<byebug\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
