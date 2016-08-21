"Chomps vimrc file

"VimPlug configuration
call plug#begin()

	Plug 'tpope/vim-sensible'
	Plug 'Raimondi/delimitMate'
		let delimitMate_expand_cr = 1
	Plug 'justinmk/vim-sneak'
		let g:sneak#streak = 1
	Plug 'Valloric/YouCompleteMe'

call plug#end()

"Use VIM setting rather than VI
set nocompatible

"Colours
colorscheme torte
set colorcolumn=80
set cursorline

"Misc
set relativenumber
set number
set wildmenu
set cmdheight=2
set autoread

"Key Mappings
map <space> /
inoremap ;l <esc>
inoremap <Nul> <C-n>

"Searching
set smartcase
set hlsearch
set incsearch

"Indenting
set ai
set si
set wrap

"Scrolling
set so=5

"Set tab to 2 spaces
set shiftwidth=2
set tabstop=2
set smarttab

"Show whitespaces
set list
set listchars=tab:\|\ ,trail:⬦,nbsp:⬦

"Enable file type plugins
filetype on
filetype indent on
filetype plugin on
syntax enable

"Remove arrow key navigation
noremap <Up>	<NOP>
noremap <Down>	<NOP>
noremap <Left>	<NOP>
noremap <Right>	<NOP>

"Filetype specific settings
autocmd Filetype gitcommit set spell spelllang=en_au | set textwidth=72
