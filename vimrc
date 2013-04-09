set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" molokai color scheme
Bundle 'molokai'

" Your personal wiki !
Bundle 'vimwiki'

""" Vim iMproved

" Ctrl-P, Just like Sublime Text 2 Command-P Goto Anything
Bundle 'kien/ctrlp.vim'
" 快速移动插件
Bundle 'Lokaltog/vim-easymotion'
" 让 vim 状态栏酷起来！
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'

Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

" visualize vim undo tree
Bundle 'Gundo'


""" Programing Plugins

Bundle 'scrooloose/nerdcommenter'
Bundle 'Townk/vim-autoclose'

" git
Bundle 'tpope/vim-fugitive'
" shows git diff in the gutter (sign column)
Bundle 'airblade/vim-gitgutter'


""" snipMate
" deps
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"

Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'

" Python
Bundle 'klen/python-mode'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'

" Javascript
Bundle 'leshill/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
Bundle 'kchmck/vim-coffee-script'

" SASS, SCSS, html, haml
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-haml'

" Other
Bundle 'Puppet-Syntax-Highlighting'

" HTML
Bundle 'ZenCoding.vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'flazz/vim-colorschemes'

filetype plugin indent on
syntax on

set backspace=indent,eol,start  " Backspace for dummies
"set linespace=0                 " No extra spaces between rows
set linespace=2
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

"set nowrap                      " Wrap long lines
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

" Strip whitespace {
function! StripTrailingWhitespace()
    " To disable the stripping of whitespace, add the following to your
    " .vimrc.local file:
    "   let g:spf13_keep_trailing_whitespace = 1
    if !exists('g:spf13_keep_trailing_whitespace')
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endif
endfunction
" }

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
\   'html_footer': '~/Dropbox/note/html/footer.tpl',
\}, {'path': '~/Dropbox/Apps/solog', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_camel_case = 0


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
colo inkpot
"colo ir_black
"colo ir_black
"map <C-P> :FufFile

let mapleader=","

" enable gitgutter hightlight changed lines
"let g:gitgutter_highlight_lines = 1

let g:EasyMotion_leader_key = '<Leader><Leader>'

set laststatus=2

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*pyc     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
map <D-/> <Leader>c<space>

nnoremap <F5> :GundoToggle<CR>

inoremap <leader>o <C-X><C-o>
inoremap <leader>f <C-X><C-f>
inoremap <leader>n <C-X><C-n>
inoremap <leader>l <C-X><C-l>

" dont' clear cache on exist
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

"open file in new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

autocmd FileType html,htmldjango,css,less,javascript,coffee,yaml,ruby setlocal shiftwidth=2 softtabstop=2 expandtab

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
