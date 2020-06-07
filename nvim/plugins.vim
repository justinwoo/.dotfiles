call plug#begin('~/.local/share/nvim/plugged')

" utilities
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'simnalamburt/vim-mundo' " undo
Plug 'jeetsukumaran/vim-buffergator' " i guess this can stay for now

" tpope
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-vinegar' " netrw helper
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'tpope/vim-eunuch' " files
Plug 'tpope/vim-jdaddy' " json aj / gqaj / gwaj
Plug 'tpope/vim-speeddating' " json aj / gqaj / gwaj
Plug 'tpope/vim-obsession' " session

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support

" PureScript
Plug 'purescript-contrib/purescript-vim', { 'for': ['purescript', 'purs'] }

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'ujihisa/unite-haskellimport'

" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support

" Markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" etc
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/denite.nvim'
Plug 'LnL7/vim-nix' " Nix
Plug 'ntpeters/vim-better-whitespace' " whitespace

call plug#end()
