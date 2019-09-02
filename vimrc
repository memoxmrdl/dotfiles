" Set to auto read when a file is changed from the outside
set autoread

" Use Vim settings
set nocompatible
set laststatus=2
set encoding=utf-8
set hidden

" Remember stuff
set history=256
set undolevels=512

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Packages [PKG]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install Plug if it's not available
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!mkdir -p ~/.vim/autoload'
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'tomtom/tlib_vim', {'for': 'asciidoc'}           " tlib - for vim-asciidoc
Plug 'dahu/Asif', {'for': 'asciidoc'}                 " asif - for vim-asciidoc
Plug 'vim-scripts/SyntaxRange', {'for': 'asciidoc'}   " SyntaxRange - for vim-asciidoc
" Plug 'marijnh/tern_for_vim', {'for': 'javascript'}    " tern - for tagbar JS support

" Vim interface extensions
Plug 'fholgado/minibufexpl.vim'                       " Elegant buffer explorer
Plug 'tpope/vim-fugitive'                             " Git wrapper so awesome, it should be illegal
Plug 'airblade/vim-gitgutter'                         " Git diff in the gutter
Plug 'bling/vim-airline'                              " Lean and mean status/tabline
Plug 'vim-airline/vim-airline-themes'                 " Collection of themes for airline
Plug 'ntpeters/vim-better-whitespace'                 " Highlight trailing whitespace

" Plug 'scrooloose/syntastic'                         " Syntax checking hacks
" Plug 'majutsushi/tagbar'                            " Tags ordered by scope
" Plug 'benmills/vimux'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'wellle/tmux-complete.vim'

" File/Buffer searching
" Plug 'kien/ctrlp.vim'                                 " Fuzzy file/buffer finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'                                " Wrapper for ack, beyond grep
" Plug 'osyo-manga/vim-hopping'                       " Incremental buffer line filtering
" Plug 'rking/ag.vim'
" Plug 'scrooloose/nerdtree'

" Motion
Plug 'tmhedberg/matchit'                              " Extended % matching
" Plug 'Lokaltog/vim-easymotion'
" Plug 'justinmk/vim-sneak'
" Plug 'tpope/vim-repeat'

" Text wrangling
Plug 'tpope/vim-commentary'                           " Comment stuff out
Plug 'godlygeek/tabular'                              " Text filtering and alignment
Plug 'kien/rainbow_parentheses.vim'                   " Better Rainbow Parentheses
" Plug 'tpope/vim-surround'
" Plug 'maxbrunsfeld/vim-yankstack'

" Text objects / Operators
" Plug 'kana/vim-textobj-user'
" Plug 'wellle/targets.vim'
" Plug 'kana/vim-textobj-fold'

" Completion
" Plug 'Valloric/YouCompleteMe'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim', {'for': 'html'}               " Emmet expanding abbreviations
" Plug 'ervandew/supertab'

" Filetype
Plug 'vim-ruby/vim-ruby', {'for' : 'ruby'}            " Vim support for Ruby
Plug 'tpope/vim-rails', {'for': 'ruby'}               " Vim support for Rails
Plug 'pangloss/vim-javascript', {'for': 'javascript'} " Vim support for Javascript
Plug 'isRuslan/vim-es6'
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}    " Vim support for Coffeescript
Plug 'othree/html5.vim', {'for': ['html', 'hbs']}              " Vim support for HTML5
Plug 'slim-template/vim-slim', {'for': 'slim'}        " Vim support for Slim
Plug 'tpope/vim-haml', {'for': 'haml'}                " Vim support for HAML/SASS
Plug 'dahu/vim-asciidoc', {'for': 'asciidoc'}         " Vim support for Asciidoc
Plug 'plasticboy/vim-markdown', {'for': 'mkd'}        " Vim support for Markdown
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'                                    " Vim support for JSX
Plug 'clavery/vim-dwre'                               " Vim support for Demandware
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'w0rp/ale'

" Colorschemes
Plug 'Heldraug/vim-megara'                            " Colorscheme focused on template
Plug 'tomasr/molokai'                                 " Port of the monokai
Plug 'altercation/vim-colors-solarized'               " Precision colorscheme
Plug 'morhetz/gruvbox'                                " Gruvbox
Plug 'dracula/vim'

call plug#end()

" Unused plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Keymaps [KEY]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""
" Vim keymaps
""""""""""""""
" Use spacebar to repeat last command
nore <Space> .
" Use . as :
nore . :
let mapleader = ","

" Reselect visual block after indent/outdent
" http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" ALE
highlight ALEWarning ctermbg=darkmagenta ctermfg=white cterm=underline
highlight ALEError ctermbg=darkmagenta ctermfg=white cterm=underline

" ALE
let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['rubocop'], 'elixir': ['mix_format']}
let g:ale_fixers = {'javascript': ['prettier'], 'ruby': ['rubocop'], 'elixir': ['mix_format']}
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_lint_delay = 100

" Paste from the clipboard without indenting
set pastetoggle=<Leader>p
set clipboard=unnamed

" Navigation keymaps
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Buffer keymaps
map <Leader>bn :bnext<cr>
map <Leader>bN :bprevious<cr>
map <Leader>bd :bdelete<cr>

" Window keymaps
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab keymaps
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

" Dismiss search highlight
nmap <Leader><Space> :nohl<cr>

" Giga save. Handle with care
nmap <leader>ww :wall!<cr>
nmap <leader>wq :wqall!<cr>
nmap <leader>qq :qall!<cr>

"""""""""""""""""
" Plugin keymaps
"""""""""""""""""
""""""""""
" NERDTree
""""""""""
" nmap <leader>nt :NERDTreeToggle<cr>

""""""""""""""""""""
" Commentary keymaps
""""""""""""""""""""
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
nmap <Leader>cu <Plug>CommentaryUndo

"""""""""
" Switch
"""""""""
nnoremap - :Switch<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Vim UI [VUI]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing position aid
set number
set numberwidth=4
set ruler
set cul
set showmatch
set backspace=indent,eol,start " Allow backspacing over everything

" Vim command line and Wildmenu
set wildmenu
set wildignore=*~,*.swp
set showcmd
set cmdheight=1

" Search options
set ignorecase
set smartcase
set hlsearch
set incsearch		" Real time match
set magic           " Regex magic

" Don't redraw while executing macros
" Note: Dooesn't looks as cool
set lazyredraw

" Bells are ugly
set novisualbell
set noerrorbells
set t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Files [FIL]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't write anything but the file
set nobackup
set nowb
set noswapfile

" Filetypes
filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
augroup vimrcEx
au!

" Return to last edit position
" autocmd BufReadPost *
     " \ if line("'\"") > 1 && line("'\"") <= line("$") |
     " \   exe "normal! g`\"" |
     " \ endif

" Remember info about open buffers on close
" set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Editing [EDT]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 4-space tabs
set softtabstop=2
set tabstop=2
set shiftwidth=2

" Use spaces for tabs
set expandtab
set smarttab

" Indent
set autoindent
set smartindent
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-> Autocmds and lang specific [AUT]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd!

" Set [...] to 2-space indent
autocmd WinEnter,FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set sts=2 ts=2 sw=2

" Text -> Git, Asciidoc
autocmd FileType text setlocal textwidth=80
autocmd FileType asciidoc setlocal textwidth=80

" Set SASS to SASS. Duh
autocmd! BufRead,BufNewFile *.sass setfiletype sass

" Set F# lex to F#
autocmd! BufRead,BufNewFile *.fsl setfiletype fsharp
autocmd! BufRead,BufNewFile *.fsy setfiletype fsharp

" Don't change tabs for spaces in Makefiles
autocmd FileType make setlocal noexpandtab

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
    exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.txt :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-> Helpers [HLP]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show syntax highlighting groups for word under cursor
" By VimCasts
nmap <leader>s :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -> Package configuration [PKC]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""
" CtrlP
""""""""""
" When opening multiple files, open them in the background
"let g:ctrlp_open_multiple_files = 'i'
nnoremap <C-p> :FZF<CR>
inoremap <C-p> <ESC>:FZF<CR>
nnoremap <c-p> :Files<CR>

" Set file finder's custom command to respect `.gitignore`
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Use The Silver Searcher (ag) as default text searching tool
let g:ackprg = 'ag --nogroup --nocolor --column'

" Fast redraw
set lazyredraw
set ttyfast

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

""""""""""""
" Airline
""""""""""""
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'powerlineish'
let g:airline_theme = 'base16'
let g:airline_extensions = ['ale']
let g:airline#extensions#ale#enabled = 1

"""""""""""""""""""""""
" Rainbow Parentheses
"""""""""""""""""""""""
" This can probably be configured in the colorscheme. Makes more sense
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3']]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""""""""""""
" Syntastic
""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:jsx_ext_required = 0
"set t_ut=
"Disable Mouse for copy/pasting purposes.
"set mouse=

""""""""""""""""""""""""""""""""""""""""
" Modcloth Specific Indentation Settings
"
"""""""""""""""""""""""""""""""""""""""
"nmap <leader>4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
"nmap <leader>2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Ignorelist
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/tmp/*
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/deps/*,*/node_modules/*,*/_build/*
set wildignore+=*/tmp/*,*/node_modules/*,*.git/*,*.so,*.swp,*.zip,DS

syntax enable
syntax on

set colorcolumn=120
" set background=dark
colorscheme molokai
"set t_Co=16
" set termguicolors
"set t_Co=256        " 256 color term
" color dracula
