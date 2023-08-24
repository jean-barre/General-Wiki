set ruler
set cursorline
set number

call plug#begin(expand('~/.vim/plugged'))

" On-demand loading
Plug 'scrooloose/nerdtree'

Plug 'scrooloose/syntastic'

Plug 'bronson/vim-trailing-whitespace'

Plug 'flazz/vim-colorschemes'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

Plug 'junegunn/fzf'

Plug 'jdonaldson/vaxe'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Initialize plugin system
call plug#end()

syntax on

filetype plugin indent on

syntax enable

set rtp+=~/.fzf

" let g:solarized_termtrans = 1 set background=dark
colorscheme tokyo-metro

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
" b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] |
	\ elseif argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif
" enable line numbers
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

let mapleader = ","
nmap <leader>nt :NERDTree<cr>

nnoremap <silent> <C-f> :FZF<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set noexpandtab
" show ▸ character on tab
set list
set listchars=tab:▸\ ,trail:·

hi cursorLine cterm=NONE gui=NONE

set cc=80

" copy to clipboard
set clipboard=unnamedplus

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_c_include_dirs = ['/usr/include']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0

" remove include errors from syntastic
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 0
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_check_header = 0
let g:syntastic_c_no_include_search = 1

" Disable vim-markdown automatic folding
let g:vim_markdown_folding_disabled = 1
set nofoldenable
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END

set rtp^=~/.vim/plugin
