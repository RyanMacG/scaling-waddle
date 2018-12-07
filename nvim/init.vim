" Allow the neovim Python plugin to work inside a virtualenv, by manually
" specifying the path to python2. This variable must be set before any calls to
" `has('python')`.
if has('nvim')
  let s:uname = system('echo -n "$(uname)"')
  if s:uname == 'Linux'
    let g:python_host_prog='/usr/bin/python2.7'
    let g:python3_host_prog='/usr/bin/python3'
  else
    let g:python_host_prog='/usr/local/bin/python'
    let g:python3_host_prog='/usr/local/bin/python3'
  end
  set termguicolors
  set inccommand=nosplit
endif

augroup vimGeneralCallbacks
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.vim nested source ~/.config/nvim/init.vim
augroup END

so ~/.config/nvim/setup_files/general.vim
so ~/.config/nvim/setup_files/dein.vim

so ~/.config/nvim/setup_files/appearance.vim
so ~/.config/nvim/setup_files/completion.vim
so ~/.config/nvim/setup_files/fzf.vim
so ~/.config/nvim/setup_files/git.vim
so ~/.config/nvim/setup_files/utilities.vim
so ~/.config/nvim/setup_files/windows.vim
