"Ryan's vimrc file

"VimPlug configuration
call plug#begin()

	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-sleuth'

	Plug 'Raimondi/delimitMate'
		let delimitMate_expand_cr    = 1
		let delimitMate_expand_space = 1

	Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}

	Plug 'justinmk/vim-sneak'
		let g:sneak#streak = 1

	Plug 'junegunn/fzf', {'on': 'FZF'}
		let $FZF_DEFAULT_COMMAND = 'ag -g ""'

	Plug 'mileszs/ack.vim'
		let g:ackprg = 'ag --vimgrep'

	Plug 'Valloric/YouCompleteMe'
		let g:ycm_add_preview_to_completeopt                = 1
		let g:ycm_autoclose_preview_window_after_completion = 1
		let g:ycm_autoclose_preview_window_after_insertion  = 1
		let g:ycm_confirm_extra_conf                        = 0
		let g:ycm_filetype_whitelist = { 'python': 1, 'cpp':1 }
		let g:ycm_error_symbol = 'x'
		let g:ycm_warning_symbol = '!'
		let g:ycm_python_binary_path = 'python'

	Plug 'lyuts/vim-rtags'

	Plug 'dag/vim-fish', {'for': 'fish'}

	Plug 'vim-airline/vim-airline'
		let g:airline#extensions#tagbar#enabled = 0

	Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
		let g:tagbar_sort = 0

	" Git
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-git'

	Plug 'airblade/vim-gitgutter'
		let g:gitgutter_sign_added    = '🞥'
		let g:gitgutter_sign_modified = '🟊'
		let g:gitgutter_sign_removed  = "x"

	Plug 'junegunn/gv.vim', { 'on': 'GV' }

call plug#end()

"Plugin mappings
nnoremap <Leader>tb   :TagbarToggle<cr>
nnoremap <Leader>tggh :GitGutterLineHighlightsToggle<cr>
nnoremap <Leader>fi   :YcmCompleter FixIt<cr>
nnoremap <Leader>gt   :YcmCompleter GoTo<cr>
nnoremap <Leader>ff   :FZF<cr>
noremap  <leader>cr   :pyf          $HOME/.local/share/clang/clang-rename.py<cr>
noremap  <leader>cf   :pyf          $HOME/.local/share/clang/clang-format.py<cr>
noremap  <leader>a    :Ack!<space>""<Left>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"Use VIM setting rather than VI
set nocompatible

"Colours
" colorscheme slate
highlight Pmenu ctermbg=233 ctermfg=129
set colorcolumn=115
set cursorline

"Misc
set relativenumber
set number
set wildmenu
set cmdheight=2

"Key Mappings
map      <space> /
inoremap ;l      <esc>
nnoremap n       nzz
nnoremap N       Nzz

"Searching
set ignorecase
set smartcase
set hlsearch

"Indenting
set ai
set si
set wrap

"Scrolling
set so=5

"Set tab to 4 spaces
set shiftwidth=4
set tabstop=4

"Show whitespaces
set list
set listchars=tab:\|\ ,trail:⬦,nbsp:⬦

"Enable file type plugins
filetype on
filetype indent on
filetype plugin on
syntax   enable

"Remove arrow key navigation
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <BS>    <NOP>

"Allow for easier window navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

"Filetype specific settings
autocmd Filetype gitcommit set spell spelllang=en_au | set textwidth=72
autocmd Filetype fish compiler fish
autocmd FileType qf map <buffer> q :quit<cr>
autocmd FileType tagbar setlocal nocursorline nocursorcolumn
