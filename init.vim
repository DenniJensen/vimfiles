call plug#begin('~/vimfiles/plugged')
Plug 'gmarik/vundle'

"#############################################################################
"  ---------------------------------------------------------------------------
" Tools
"  ---------------------------------------------------------------------------
" Archive for later

" Find a repace
" Plug 'brooth/far.vim'

" A code-completion engine for vim
" Plug 'Valloric/YouCompleteMe'

"#############################################################################
Plug 'Townk/vim-autoclose'


Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Use TAB for completion
Plug 'ervandew/supertab'

" Allign code
" Plug 'godlygeek/tabular'

" TODO replace this with fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Find stuff
Plug 'rking/ag.vim'


" Syntax checker
Plug 'scrooloose/syntastic'

" ES6 template strings support
" Plug 'Quramy/vim-js-pretty-template'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" HTML completion with C-e (write haml style and transform to html)
" Plug 'rstacruz/sparkup'

Plug 'Yggdroot/indentLine'
"
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'alvan/vim-closetag'


"#############################################################################
"  ---------------------------------------------------------------------------
" colorschemes
"  ---------------------------------------------------------------------------
"#############################################################################
" Plug 'therealechan/vim-railscasts-theme'
Plug 'twerth/ir_black'
Plug 'rakr/vim-one'
" Plug 'chriskempson/base16-vim'
" Plug 'altercation/vim-colors-solarized'
Plug 'ericbn/vim-solarized'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'hzchirs/vim-material'

"#############################################################################
"  ---------------------------------------------------------------------------
" Language Support
"  ---------------------------------------------------------------------------
"#############################################################################

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'keith/rspec.vim'

" Basic syntax highglighting for some languages
Plug 'sheerun/vim-polyglot'

" Plug 'kchmck/vim-coffee-script'
" Plug 'digitaltoad/vim-pug'
" Plug 'amadeus/vim-mjml'
" Plug 'cakebaker/scss-syntax.vim'

" typescript IDE for vim
" maybe not needed because no support of neovim. Looks like support for vim
" only
" Plug 'Quramy/tsuquyomi'


" More Highlighting for typescript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}


" Plug 'Shougo/deoplete.nvim'

" For async completion
" For Denite features
" Plug 'Shougo/denite.nvim'

" Plug 'Shougo/vimproc.vim'

Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'

Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
" Plug 'vim-scripts/SyntaxComplete'

call plug#end()



"#############################################################################
"  General
"#############################################################################
filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
set modelines=0
syntax on
set nobackup
set nowritebackup
set noswapfile
set history=1000
set autoread
:tnoremap <Esc> <C-\><C-n>

set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set autowrite
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes



"#############################################################################
" Typescript support
"#############################################################################
if has("autocmd")
  au BufRead,BufNewFile *.ts  set filetype=typescript
  " au FileType typescript setlocal completeopt-=menu,preview
  " au FileType typescript setlocal completeopt-=menu
endif

let g:coc_global_extensions = [
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-tsserver',
      \ 'coc-tslint',
      \ 'coc-tslint-plugin',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-pyls',
      \ 'coc-yaml'
      \]

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

let g:acp_enableAtStartup = 0
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:tsuquyomi_completion_detail = 1

let g:closetag_filetypes = 'html,xhtml,phtml'

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <Leader>w <Plug>(coc-diagnostic-prev)
nmap <silent> <Leader>s <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> <Leader>D <Plug>(coc-type-definition)
nmap <silent> <Leader>i <Plug>(coc-implementation)
nmap <silent> <Leader>lf <Plug>(coc-references)
nmap <silent> <Leader>q <Plug>(coc-codeaction)


" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

"#############################################################################
" Golang support
"#############################################################################

if has("autocmd")
  au BufNewFile,BufRead *.go set filetype=go
  au FileType go nmap <Leader>b <Plug>(go-build)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>r <Plug>(go-run)
  au FileType go nmap <Leader>t <Plug>(go-test)
  au FileType go nmap gd <Plug>(go-def-tab)
  au FileType go setl ts=4 sw=4 sts=4 noet
endif

let g:go_fmt_command = "goimports"


" Syntax highlight Functions, Methods, and Structs
let g:go_highlight_structs = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_extra_types =1
let g:go_highlight_functions_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['go', 'govet', 'errcheck']

" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"#############################################################################
" Ruby support
"#############################################################################

if has("autocmd")
  " Other files to consider Ruby
  au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

  " autocmd FileType ruby set omnifunc=rubycomplete#Complete
  au FileType ruby let g:rubycomplete_buffer_loading = 1
  au FileType ruby let g:rubycomplete_classes_in_global = 1
  au FileType ruby let g:rubycomplete_rails = 1
  au BufRead *_spec.rb syn keyword rubyRspec describe context it specify it_should_behave_like before after setup subject its shared_examples_for shared_context let
  highlight def link rubyRspec Function

  " au FileType ruby map <Leader>r :RuboCop -a<CR>
  au BufNewFile,BufRead *_spec.rb set filetype=rspec
  au BufNewFile,BufRead *_examples.rb set filetype=rspec
  au FileType ruby compiler ruby
endif

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1

let ruby_operators = 1


"#############################################################################
"  ---------------------------------------------------------------------------
"	 AUTOCOMPLETE
"  ---------------------------------------------------------------------------
"#############################################################################
set completeopt=menu,longest
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" let g:deoplete#enable_at_startup = 1


"#############################################################################
"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------
"#############################################################################
set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set norelativenumber
set undofile
set nofoldenable

" Auto adjust window sizes when they become current
set winwidth=81
" set winheight=5
" set winminheight=5
set splitbelow splitright

"#############################################################################
"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------
"#############################################################################
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
set textwidth=79
set formatoptions=n
set nofoldenable

if exists("+colorcolumn")
  set colorcolumn=80
endif


"#############################################################################
"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------
"#############################################################################

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" ACK
" set grepprg=ack
" nnoremap <leader>a :Ack<Space>

" New Tab
nnoremap <leader>t :tabnew<CR>

" Open Explor
nnoremap <leader>e :Explore<CR>

" AG
nnoremap <leader>a :Ag<Space>

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>

if exists(":Tabularize")
  nmap <leader>g= :Tabularize /=<CR>
  vmap <leader>g= :Tabularize /=<CR>
  nmap <leader>g: :Tabularize /:\zs<CR>
  vmap <leader>g: :Tabularize /:\zs<CR>
endif

"#############################################################################
"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------
"#############################################################################
set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/zsh

"  ---------------------------------------------------------------------------
"  Language Mappings
"  ---------------------------------------------------------------------------
if has("autocmd")
  " Python
  autocmd FileType python setl ts=4 sw=4 sts=4 noet

  " mjml
  au BufRead,BufNewFile *.mjml set filetype=haml

  " CoffeeScript
  let coffee_compile_vert = 1
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

  " SASS / SCSS
  au BufNewFile,BufReadPost *.scss setl foldmethod=indent
  au BufNewFile,BufReadPost *.sass setl foldmethod=indent
  au BufRead,BufNewFile *.scss set filetype=scss
  autocmd BufNewFile, BufRead *.html.erb set filetype=html.erb
endif

if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set t_Co=256
set t_ut=

let iterm_profile = $ITERM_PROFILE
colorscheme one
" set background=dark

if iterm_profile == "Dark"
  set background=dark
else
  colorscheme one
  set background=light
endif

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

let g:airline_powerline_fonts = 1

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" CtrlP
nmap <leader>f :FZF<cr>
" let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore node_modules --ignore DS_Store --ignore git --ignore public/assets --ignore public/cached-assets --ignore public/cms-assets --ignore public/assets/source_maps --ignore doc --ignore public/uploads -g ""'
let g:ctrlp_use_caching = 1
set rtp+=/usr/local/opt/fzf
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Airline
let g:Powerline_symbols = 'fancy'
au CursorHold * checktime
au FocusGained * checktime

" Add settings for tabular
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .init.vim source %
autocmd! bufwritepost init.vim source %
