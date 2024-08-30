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

" buffer navigation
nmap <leader><leader> <C-^>

" allow hidden buffers
set hidden

" syntax highlighting
syntax on
syntax sync fromstart
set background=dark
set hlsearch
set incsearch

" encryption
set cm=blowfish2

" file type detection
autocmd BufRead,BufNewFile *.jbuilder setfiletype ruby
autocmd BufRead,BufNewFile *.mjml setfiletype haml
autocmd BufRead,BufNewFile *.vue setfiletype html
autocmd BufRead,BufNewFile .babelrc,.eslintrc,.prettierrc setfiletype json
autocmd BufRead,BufNewFile Appraisals setfiletype ruby
autocmd BufRead,BufNewFile Capfile setfiletype ruby
autocmd BufRead,BufNewFile .envrc setfiletype sh

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
let g:markdown_fenced_languages = ['css', 'elixir', 'erb=eruby', 'haml', 'html', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'sh', 'sql', 'xml']

" highlight Ruby symbol list literals properly
hi link rubySymbolDelimiter rubyStringDelimiter

" highlight JavaScript object keys like Ruby hash keys
hi def link jsObjectKey jsString

" JSX
let g:jsx_ext_required = 0 " allow JSX in normal JS files
"autocmd! BufWrite *.jsx :normal gg=G`` " fix auto-indent

" fix :E by disabling LogiPat which defines :ELP
let g:loaded_logipat = 1

" templates
autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
