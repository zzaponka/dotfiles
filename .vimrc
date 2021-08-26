" General setup
" no compatibility with original vi
set nocompatible
" required by vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'valloric/youcompleteme'
Bundle 'badwolf'
Plugin 'easymotion/vim-easymotion'
Plugin 'preservim/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()

filetype plugin indent on
syntax on " enable syntax processing

" Pathogen
" execute pathogen#infect()

" Spaces and tabs
set autoindent
set tabstop=8
set softtabstop=8
set noexpandtab
set shiftwidth=8
set list " show non-printed symbols
" set listchars=tab:>-,space:·,eol:$
set listchars=tab:>-,eol:$,trail:·,space:·
" set listchars=tab:>-,eol:$,trail:·
filetype indent on " load filetype-specific indent files

" General formatting
set tw=79

" UI configuration
set nowrap " do not wrap long lines
set number " show line numbers
set relativenumber " show relative line numbers for easy vertical movement
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set wildmode=list:longest
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]
set splitright " for cscope to show results in a new window on the right

" Searching
set ignorecase " ignore case while searching with / and ? commands
set incsearch " search as characters are entered
set hlsearch " highlight matches

" Editing options
set hidden  " switch between buffers without saving

" Completion
set completeopt=menuone

" Key mappings
let mapleader=","
nmap <F2> :TagbarToggle<CR>
nmap <F3> :cp<CR>
nmap <F4> :cn<CR>
" nnoremap <silent> <F4> :TlistToggle<CR>

" Tagbar options
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_zoomwidth = 0

" NeoComplCache options
let g:neocomplcache_enable_at_startup = 1

" vim indent guides options
let g:indent_guides_enable_on_vim_startup = 1

" trying deoplete
let g:deoplete#enable_at_startup = 1

" Mouse scroll enable
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Use cscope for tags jumping
set cscopetag

" cscope keyboard mappings
" 's'   symbol: find all references to the token under cursor
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" 'g'   global: find global definition(s) of the token under cursor
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" 'c'   calls:  find all calls to the function name under cursor
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>

" all the same but split window vertically:
nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>

" Status line
set laststatus=2
                        " comment to test indentation

" Colors
highlight ColorColumn ctermbg=245 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")
set t_Co=256
colorscheme badwolf

" Custom functions
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
