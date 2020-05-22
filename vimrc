" Global settings
set showcmd
set confirm
set noswapfile



" Misc editor tings
set number
set cursorline
:filetype plugin indent on
set nofoldenable
set foldmethod=syntax
set hlsearch
set backspace=indent,eol,start
set noshowmode
set noshowcmd
set shortmess+=F



" Indentation and spacing
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4



" Misc
let $BASH_ENV="~/.zshrc"



" === Plugins ===
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'xolox/vim-misc'
Plug 'jiangmiao/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'psf/black', { 'tag': '19.10b0' }

" colorsss
Plug 'junegunn/seoul256.vim'

" Deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }
Plug 'junegunn/fzf'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'keith/swift.vim', { 'for': 'swift' }
call plug#end()



" Colors
let g:seoul256_background=236
set background=dark
colorscheme seoul256
highlight Search ctermbg=DarkYellow
highlight Search ctermfg=Black
highlight MatchParen ctermbg=Yellow
highlight MatchParen ctermfg=Black



" Airline
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_skip_empty_sections = 1



" LanguageClient
set runtimepath+=~/.vim/plugged/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['$CLANGD_PATH'],
    \ 'c': ['$CCLS_PATH'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', '$RLS_PATH'],
    \ 'python': ['$PYLS_PATH']
    \}
let g:LanguageClient_autoStart = 1
nnoremap <silent> <S-h> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
set completeopt+=menuone,longest,noselect
set completeopt-=preview



" Deoplete
let g:deoplete#enable_at_startup = 1



" CPP Enhanced Highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1



" Clang Format
let g:clang_format#code_style = "LLVM"
let g:clang_format#auto_format = 1



" Rust
autocmd BufWritePre *.rs execute ':RustFmt'



" Black
autocmd BufWritePre *.py execute ':Black'



" key mappings
let mapleader = "\<Space>"
:imap <silent> <D-a> <C-o>b
:imap <silent> <D-s> <C-o>j
:imap <silent> <D-d> <C-o>e
:imap <silent> <D-w> <C-o>k
:imap jk <Esc>
:vnoremap <C-c> "*y
:vnoremap <C-v> "*v
:nnoremap <leader>\ :NERDTreeToggle<CR>
:nmap <silent> <leader>j :wincmd W<CR>
:nmap <silent> <leader>k :wincmd w<CR>
" Display fullpath of current file
:nmap <silent> <C-f> :echo expand('%:p:h')<CR>
:inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>" 
:inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
:tnoremap <Esc> <C-\><C-n>
