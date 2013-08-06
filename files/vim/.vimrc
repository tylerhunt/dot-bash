" enable plugins
call pathogen#infect()
filetype plugin indent on

" indenting and shifting
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab

" bracket matching
set showmatch
set matchtime=2

" lines and columns
set ruler
"set number
nmap <silent> <leader>n :set number!<CR>

" allow hidden buffers
set hidden

" syntax highlighting
syntax on
syntax sync fromstart
set background=dark
set hlsearch

" syntax file types
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead config.ru set ft=ruby
autocmd BufNewFile,BufRead Guardfile set ft=ruby

" highlight tabs and trailing whitespace
set list
set listchars=tab:>-,trail:·
highlight SpecialKey ctermbg=red ctermfg=white
nmap <silent> <leader>l :set list!<CR>

" spell checking
set spell
nmap <silent> <leader>s :set spell!<CR>

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

" Markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']
