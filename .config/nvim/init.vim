"
" .vimrc/init.vim
"

" General
syntax on
let mapleader=" "
set encoding=utf-8
set wildmode=longest,list,full
set noerrorbells
set splitbelow splitright
set number
set nowrap
set showcmd " show currently inputted letters in normal mode
set ic " improved search mode
set nohlsearch " remove search highlighting
set smartcase " search ignores case if everything is lowercase
set noswapfile " disable swapfiles (looking for replacement)

" Tabs and indenting
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent " apparently, smartindent is a no-no
filetype plugin indent on

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-sleuth' " better tab support
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/emmet-vim'
"Plug 'posva/vim-vue'
call plug#end()

" Plugin settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_preview = 1
let g:netrw_list_hide= '.git'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode="ra"
let g:go_fmt_command = 'goimports' " enables autoimports, but slow on large codebases
let g:go_fmt_autosave = 'gopls'
let g:go_rename_command = 'gopls' " since the last update it uses gopls by default
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['typecheck']
"let g:go_metalinter_command = 'gopls'
"let g:go_metalinter_command='golangci-lint'
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"let g:go_gopls_staticcheck = 1
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-python',
    \ 'coc-vetur'
    \ ]
"    \ 'coc-eslint',
"    \ 'coc-pairs',

" Show all diagnostics.
nnoremap <silent><nowait> <leader>a  :<C-u>CocDiagnostics<cr>
nmap <leader>r <Plug>(coc-rename)

" Coloring and syntax highlighting
set colorcolumn=100
colorscheme onedark
highlight Normal ctermbg=NONE guibg=NONE " remove background color to match terminal's
hi Comment ctermfg=cyan

" Autocommands
fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd BufWritePre * %s/\s\+$//e " trim trailing spaces on save

" Custom binds
if !exists(":Ref") " check if ref exists, make it refresh the buffer's .vimrc
    command Ref source ~/.config/nvim/init.vim
endif

map <C-S-v> "+P
map <C-S> :w<CR>
map <leader>s !clear && shellcheck %<CR>
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>e :Lexplore<CR>
nnoremap <C-\> :vs<CR>:term<CR>
vnoremap <C-S-c> "*y :let @+=@*<CR>
tnoremap <ESC> <C-\><C-n>

