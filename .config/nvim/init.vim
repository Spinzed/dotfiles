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
set showcmd " show currently inputed letters in normal mode
set incsearch " improved search mode (alias ic)
set ignorecase " same as set ic, ignores case on search except if an uppercase letter is passed
set nohlsearch " remove search highlighting
set smartcase " search ignores case if everything is lowercase
set noswapfile " disable swapfiles (looking for replacement)

" Tabs and indenting
set tabstop=4 softtabstop=4 " tab and space indent width
set shiftwidth=4 " indent on newline
set expandtab " convert tabs to spaces
set autoindent " apparently, smartindent is a no-no
filetype plugin indent on

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/emmet-vim'
call plug#end()

" Plugin settings

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
let g:netrw_preview = 1
let g:netrw_list_hide= '.git'

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode="ra"

" vim-go
let g:go_fmt_autosave = 1
let g:go_fmt_command = 'gopls' " the default, other option are gofmt and goimports

let g:go_rename_command = 'gopls'
"let g:go_gopls_staticcheck = v:null
let g:go_gopls_staticcheck = 1


let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['gosimple', 'staticcheck', 'typecheck', 'unused', 'varcheck']
let g:go_metalinter_autosave_enabled = ['gosimple', 'staticcheck', 'typecheck', 'unused', 'varcheck']

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
"let g:go_highlight_function_parameters = 1
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_build_constraints = 1

" coc
"let g:coc_global_extensions = [
"    \ 'coc-go',
"    \ 'coc-tsserver',
"    \ 'coc-json',
"    \ 'coc-python',
"    \ 'coc-vetur'
"    \ ]
"    \ 'coc-eslint',
"    \ 'coc-pairs',

" Lang settings
autocmd Filetype javascript,typescript setlocal
    \ tabstop=2 softtabstop=2
    \ shiftwidth=2

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

"autocmd BufWritePre * %s/\s\+$//e " trim trailing spaces on save
autocmd BufWritePre * call StripTrailingWhitespace()

" Custom binds
if !exists(":Ref") " check if ref exists, make it refresh the buffer's .vimrc
    command Ref source ~/.config/nvim/init.vim
endif

" map <C-S-v> "+P - paste from clipboard in gvim
map <C-S> :w<CR>
map <leader>s !clear && shellcheck %<CR>
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>e :Lexplore<CR>
map <leader>t :filetype detect<CR> " refresh file type
nnoremap <C-\> :vs<CR>:term<CR><S-a>
vnoremap <C-S-c> "*y :let @+=@*<CR>
tnoremap <ESC> <C-\><C-n>
" Plugin binds
nnoremap <silent><nowait> <leader>a :<C-u>CocDiagnostics<cr>
nmap <leader>r <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)
map <leader>g :GoDecls<CR>
map <leader><s-g> :GoDeclsDir<CR>

" Temporary cheat sheet
" :args *.type - load all files as buffers
" :argdo :normal gg - execute combination in all buffers
" bd - close all buffers and leave empty one

