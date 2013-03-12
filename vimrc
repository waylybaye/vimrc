set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'molokai'

Bundle 'vimwiki'

" neocompcache
"Bundle 'Shougo/neocomplcache'

" snipMate
" deps
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'

" git
Bundle 'tpope/vim-fugitive'
" shows git diff in the gutter (sign column)
Bundle 'airblade/vim-gitgutter'

""" Vim improvement
" Ctrl-P
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'

" visualize vim undo tree
Bundle 'Gundo'

" Program
Bundle 'scrooloose/nerdcommenter'

" Python
Bundle 'klen/python-mode'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'

" Other
Bundle 'Puppet-Syntax-Highlighting'

" HTML
Bundle 'ZenCoding.vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'flazz/vim-colorschemes'


syntax on

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" }

" Formatting {

set nowrap                      " Wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
"set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

" }
"
colo slate

map <c-a> ggVG
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"autocmd BufWritePre * silent! %s/\s\+$//
"autocmd BufWritePre * silent! %s/\(\s*\n\)\+\%$//

autocmd BufWritePre * silent! %s/\s\+$//
autocmd BufWritePre * silent! %s/\(\s*\n\)\+\%$//

"autocmd BufReadPost * NERDTree %

"Vimwiki settings
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{'path': '~/Dropbox/note',
\   'path_html': '~/Dropbox/note/html',
\   'html_header': '~/Dropbox/note/html/header.tpl',
\   'html_footer': '~/Dropbox/note/html/footer.tpl'}]
let g:vimwiki_camel_case = 0

"filetype on
filetype plugin on

"set foldmethod=indent
"set foldlevel=100

set directory=~/tmp,/tmp

map <leader>tt <Plug>VimwikiToggleListItem

set guifont=Monaco:h12

if has("gui")
    set guioptions-=L
    set guioptions-=r
    "set background=light
    set guioptions-=T
    set hlsearch
    " set lines=45
    " set columns=100
endif


"let NERDTreeIgnore=['\.pyc']

":hi! htmlLink gui=NONE
let html_no_rendering=1
colorscheme molokai
"colo ir_black
"colo ir_black
"map <C-P> :FufFile

let mapleader=","

" enable gitgutter hightlight changed lines
let g:gitgutter_highlight_lines = 1

let g:EasyMotion_leader_key = '<Leader><Leader>'

set laststatus=2

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*pyc     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
map <D-/> <Leader>c<space>

nnoremap <F5> :GundoToggle<CR>

inoremap <leader>, <C-X><C-o>
inoremap <leader>: <C-X><C-f>
inoremap <leader>= <C-X><C-l>
