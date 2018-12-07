" Autoinstall dein
let g:dein_dir = expand('~/.config/nvim/dein')
let g:dein_plugin_dir = expand('~/.config/nvim/dein_plugins')

if empty(glob(g:dein_dir))
  exec 'silent !mkdir -p '.g:dein_dir
  exec '!git clone git@github.com:Shougo/dein.vim '.g:dein_dir
endif

exec 'set runtimepath^='.g:dein_dir

if dein#load_state(g:dein_plugin_dir)
  call dein#begin(g:dein_plugin_dir)
  call dein#add(g:dein_dir)

  " Appearance
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('vim-airline/vim-airline')
  call dein#add('trevordmiller/nova-vim')
  call dein#add('junegunn/limelight.vim')
  call dein#add('junegunn/goyo.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('andymass/vim-matchup')

  " Languages
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Valloric/MatchTagAlways')
  call dein#add('vim-ruby/vim-ruby')

  " Linting
  call dein#add('w0rp/ale')

  " Completion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('Shougo/neco-syntax')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('autozimu/LanguageClient-neovim', { 'branch': 'next', 'build': 'bash install.sh' })
  call dein#add('tpope/vim-endwise')

  " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('gregsexton/gitv')
  call dein#add('airblade/vim-gitgutter')

  " Utilities
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'build': './install --all' })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('Shougo/neomru.vim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('kshenoy/vim-signature')
  call dein#add('mhinz/vim-startify')
  call dein#add('tpope/vim-sleuth')
  call dein#add('Raimondi/delimitMate')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('AndrewRadev/switch.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('Konfekt/FastFold')
  call dein#add('Shougo/junkfile.vim')
  call dein#add('junegunn/vim-peekaboo')
  call dein#add('mbbill/undotree')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('tpope/vim-sleuth')
  call dein#add('kristijanhusak/vim-carbon-now-sh')

  " Windows/panes/movement
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/unite.vim')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
