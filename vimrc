"Chomps vimrc file

"VimPlug configuration
call plug#begin()

	Plug 'tpope/vim-sensible'
	Plug 'Raimondi/delimitMate'
		let delimitMate_expand_cr = 1
		let delimitMate_expand_space = 1
	Plug 'tpope/vim-commentary'
	Plug 'justinmk/vim-sneak'
		let g:sneak#streak = 1
	Plug 'dag/vim-fish', {'for': 'fish'}
	Plug 'vim-airline/vim-airline'
	Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
		let g:airline#extensions#tagbar#enabled = 0
	
	" Git
	Plug 'airblade/vim-gitgutter'
		let g:gitgutter_sign_removed = '-'
		let g:gitgutter_sign_modified_removed = '~-'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-git'
	Plug 'junegunn/gv.vim', { 'on': 'GV' }

call plug#end()

"Plugin mappings
nnoremap <Leader>tb :TagbarToggle<cr>
nnoremap <Leader>tggh :GitGutterLineHighlightsToggle<cr>
nnoremap <Leader>fi :YcmCompleter FixIt<cr>
nnoremap <Leader>gt :YcmCompleter GoTo<cr>

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

"Allow for easier window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

"Filetype specific settings
autocmd Filetype gitcommit set spell spelllang=en_au | set textwidth=72
autocmd Filetype fish compiler fish
