"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/house.chou/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/house.chou/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'majutsushi/tagbar'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/unite-outline'
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'potion'
NeoBundle 'bitbake'
" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"# Plugins setting

"## air-line
set laststatus=2
"let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_preview = 1
let g:airline_theme='dark'

"## CtrlP
let g:ctrlp_max_files=0 "no limit files
let g:ctrlp_match_window = 'results:20'

"## Tagbar
nmap <F2> :TagbarToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

set nu
set hlsearch
set mouse=a

"Set leader to <Space>
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

"Edit vimrc quickly and apply immediately
nmap <leader>e :e ~/.vimrc<CR>
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"A buffer becomes hidden when it is abandoned
set hidden

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

"# Files, backups and undo
" ## Turn backup off
set nobackup
set nowb
set noswapfile

"Toggles paste mode
nnoremap <F12> :set invpaste paste?<CR>i
set pastetoggle=<F12>
set showmode

"Toggles indent line
set list listchars=tab:\|-,trail:.,extends:>
set nolist
nmap <leader>i :set list!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
colorscheme wombat256d
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<space>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>

"Exit insert mode quickly
inoremap jk <ESC>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Grep searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map  <F5> :execute "lgrep! -srnw --binary-files=without-match --exclude-dir=.git --exclude-dir=.svn . -e " . expand("<cword>") . " "<bar>lw<CR><CR>
nmap <silent> <leader>l :call LocationlistToggle()<CR>
augroup LoctionlistToggle
  autocmd!
  autocmd BufWinEnter quickfix let g:llist_opened = 1
  autocmd BufWinLeave quickfix let g:llist_opened = 0
augroup END
set switchbuf+=usetab,newtab "new tab for quickfix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! LocationlistToggle()
  if g:llist_opened
    lclose
    let g:llist_opened = 0
  else
    lopen
    let g:llist_opened = 1
  endif
endfunction
