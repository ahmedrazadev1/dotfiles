""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings

" Use , as <Leader>
let mapleader=","

" Use %% on the command line to expand to the dir of the current file
cnoremap %% <C-R>=fnameescape(expand("%:h")) . "/" <CR>

" Esaier way to escape
inoremap kj <Esc>
cnoremap kj <Esc>

" Quickly open files in split panes
noremap <Leader>es :sp %%
noremap <Leader>ev :vsp %%
noremap <Leader>ew :e %%

" Preserve indentation when moving lines
" See http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Always move linewise in normal mode
nnoremap k gk
nnoremap j gj

" Automatically indent pasted lines
nnoremap p p=`]
nnoremap P P=`]

" Re-select the last pasted text
nnoremap gp `[v`]

" Tabs
nnoremap tn :tabnew<Space>

nnoremap  tk :tabnext<CR>
nnoremap  tj :tabprev<CR>

nnoremap  th :tabfirst<CR>
nnoremap  tl :tablast<CR>

" VIMRC
nnoremap <leader>av :tabnew $MYVIMRC<CR>


" Open :Ack with <Leader>a
" nnoremap <Leader>a :Ack<Space>
" vnoremap <Leader>a :Ack<Space>
nnoremap <Leader>af :Ack  %<Left><Left>


" Toggle wrapping with <Leader>w
noremap <Leader>w :set wrap!<CR>

" Clear highlighting for the current search with <Leader>/
" Adapted from https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting/657484#657484
nnoremap <Leader>/ :let @/=""<Return>

" Prettier
nnoremap = :Prettier<CR>

" toggle commenting of lines with command + /
vnoremap <leader>c :Commentary<CR>
nnoremap <leader>c :Commentary<CR>

" Toggle file drawer in/out
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" line moves
nnoremap A $

vnoremap A $
" Reload Source
noremap <leader>rv :source $MYVIMRC<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

call plug#begin('~/.vim/autoloads')
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim'
Plug 'kien/ctrlp.vim'
Plug 'mattn/webapi-vim'
Plug 'scrooloose/nerdtree'
Plug 'soft-aesthetic/soft-era-vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hzchirs/vim-material'
Plug 'jxnblk/vim-mdx-js'
Plug 'tpope/vim-sleuth'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'wincent/command-t', {
  \ 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }
Plug 'wincent/terminus'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown'] }
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behaviors

" Keep .swp files in uniquely-named files in $HOME/.vim/swapfiles
set directory=$HOME/.vim/swapfiles//

" Show line numbers
" set number
set relativenumber
set rnu
" Enable yanking to the clipboard
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wrapping
" When wrapping, break on word boundaries
set linebreak



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching

" Highlight search matches
set hlsearch

" Ignore node_modules with command-t
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax

" Allow JSX in .js files
let g:jsx_ext_required=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prettier

" Make vim-prettier use prettier defaults
let g:prettier#config#bracket_spacing="true"
let g:prettier#config#jsx_bracket_same_line="false"
let g:prettier#config#parser="babylon"
let g:prettier#config#single_quote="true"
let g:prettier#config#trailing_comma="none"

" Don't use vim-prettier's auto-formatting
let g:prettier#autoformat=0

let g:ale_linters = {'javascript': ['prettier', 'eslint']}
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fix_on_save = 1

" Run prettier async before saving
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.md PrettierAsync
autocmd BufWritePre .babelrc, .eslintrc, .prettierrc PrettierAsync

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors

" Enable gui colors in the terminal
set termguicolors
syntax on
color vim-material
" Use current terminal color scheme for vim
if filereadable(expand("~/.vimrc_background"))
  "let base16colorspace=256
  source ~/.vimrc_background
endif

set expandtab

" The number of spaces to use for each indent
set shiftwidth=2

" Number of spaces to use for a <Tab> during editing operations
set softtabstop=2"
set guifont=Fira\ Code
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't wrap lines
set nowrap


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp use .gitignore
" https://github.com/kien/ctrlp.vim/issues/174
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use babylon parser with prettier
let g:prettier#config#parser="babylon"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run prettier asynchronously before saving
let g:prettier#autoformat=0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use JSON in .babelrc files
autocmd BufRead,BufNewFile .babelrc setfiletype json

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow JSX in .js files
let g:jsx_ext_required=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore node_modules with command-t
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat mdx as md

autocmd BufNewFile,BufRead *.mdx set syntax=markdown
