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

	Plug 'junegunn/fzf', {'on': 'FZF'}
		let $FZF_DEFAULT_COMMAND = 'ag -fUp ~/.vim/.search_ignore -g ""'
		let g:fzf_layout = { 'window': { 'width': 0.99, 'height': 0.4, 'relative': v:true, 'yoffset': 1.0  } }

	Plug 'mileszs/ack.vim', {'on': 'Ack'}
		let g:ackprg = 'ag --vimgrep --silent -fUp ~/.vim/.search_ignore'

	Plug 'dag/vim-fish', {'for': 'fish'}

	Plug 'editorconfig/editorconfig-vim'
		let g:EditorConfig_exclude_patterns = ['fugitive://.*']

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

	" LSP
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/vim-lsp'
		let g:lsp_log_file = expand('~/vim-lsp.log')
		let g:lsp_log_verbose = 1

		let g:lsp_diagnostics_echo_cursor = 1
		let g:lsp_signs_enabled = 1
		let g:lsp_signs_error = {'text': '✗'}
		let g:lsp_signs_warning = {'text': '⚠️'}
		let g:lsp_signs_information = {'text': '🛈'}
		let g:lsp_signs_hint = {'text': '☛'}
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'


call plug#end()

"Plugin mappings
nnoremap <Leader>tb   :TagbarToggle<cr>
nnoremap <Leader>vb   :Vista!!<cr>
nnoremap <Leader>tggh :GitGutterLineHighlightsToggle<cr>
nnoremap <Leader>ff   :FZF<cr>
noremap  <leader>cif  :pyf          $HOME/.local/share/clang/clang-include-fixer.py<cr>
noremap  <leader>a    :Ack!<space>""<Left>
noremap  <leader>gs   :Gstatus<cr>
noremap  <leader>gb   :Gblame<cr>

" LSP Experimental
nnoremap <Leader>rf   :LspReferences<cr>
nnoremap <Leader>rJ   :LspDeclaration<cr>
nnoremap <Leader>rj   :LspDefinition<cr>
nnoremap <Leader>ri   :LspImplementation<cr>
nnoremap <Leader>rs   :LspStatus<cr>
nnoremap <Leader>rw   :LspRename<cr>
xnoremap <Leader>cf   :LspDocumentRangeFormat<cr>
nnoremap <Leader>rd   :LspDocumentDiagnostics<cr>
nnoremap <Leader>rh   :LspHover<cr>
nnoremap <Leader>rn   :LspNextError<cr>
nnoremap <Leader>rp   :LspPreviousError<cr>
nnoremap <Leader>fi   :LspCodeAction<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

"Use VIM setting rather than VI
set nocompatible

"Colours
colorscheme slate
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
:nnoremap Q <Nop>

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

"LSP settings
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd',
                        \'-compile-commands-dir=build/',
                        \'-clang-tidy',
                        \'-all-scopes-completion',
                        \'-function-arg-placeholders',
                        \'--header-insertion=iwyu',
                        \'-suggest-missing-includes',
                        \'-background-index',
                        \'--pch-storage=memory',
                        \'-j=2']},
                    \ 'root_uri':{server_info->lsp#utils#path_to_uri(
                        \ lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(),
                        \ 'build/'))},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif
" \'-allow-fallback-completion',
" \'--header-insertion=iwyu',

if executable('pyls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'whitelist': ['python'],
                \ })
endif


"Filetype specific settings
autocmd Filetype gitcommit set spell spelllang=en_au | set textwidth=72
autocmd Filetype markdown set spell spelllang=en_au
autocmd Filetype fish compiler fish
autocmd FileType qf map <buffer> q :quit<cr>
autocmd FileType qf nnoremap <buffer> <C-t> <C-W><Enter><C-W>T
autocmd FileType tagbar setlocal nocursorline nocursorcolumn
au FileType python setlocal equalprg=autopep8\ -
au FileType xml setlocal equalprg=xmllint\ --format\ -
autocmd FileType text.lsp-hover map <buffer> q :quit<cr>

