" enable plugins
call pathogen#infect()
filetype plugin indent on

" whitespace
set autoindent
set shiftwidth=2
set tabstop=2
set expandtab
set nojoinspaces

" bracket matching
set showmatch
set matchtime=2

" lines and columns
set ruler
nmap <silent> <leader>n :set number!<CR>

" allow hidden buffers
set hidden

" syntax highlighting
syntax on
syntax sync fromstart
set background=dark
set hlsearch

" file type detection
au BufRead,BufNewFile *.vue setfiletype html
au BufRead,BufNewFile Appraisals setfiletype ruby

" highlight tabs and trailing whitespace
set list
set listchars=tab:>-,trail:·
highlight SpecialKey ctermbg=red ctermfg=white
nmap <silent> <leader>l :set list!<CR>

" spell checking
set spell
highlight SpellBad term=reverse ctermbg=darkred
nmap <silent> <leader>s :set spell!<CR>

" Markdown
let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'haml', 'html', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

" JSX
let g:jsx_ext_required = 0 " allow JSX in normal JS files
