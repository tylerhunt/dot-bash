" indenting and shifting
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab
filetype plugin indent on

" bracket matching
set showmatch
set matchtime=2

" lines and columns
set ruler
"set number

" allow hidden buffers
set hidden

" syntax highlighting
syntax on
syntax sync fromstart
set background=dark
set hlsearch

" match highlighting
highlight ExtraWhitespace ctermbg=darkred ctermfg=white
call matchadd('ExtraWhitespace', '\s\+$', -1)
call matchadd('ExtraWhitespace', '\t', -1)
highlight OverLength ctermbg=darkblue ctermfg=white
call matchadd('OverLength', '\%81v.\+', -1)

" spell checking
set spell

" map tab to escape
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
inoremap <Tab> <Esc>`^

" key maps
map <F2> :syntax sync fromstart<CR>
map <F3> :set foldmethod=syntax<CR>
map <F4> :set foldmethod=indent<CR>
map <C-S> :'t,.!sort<CR>
