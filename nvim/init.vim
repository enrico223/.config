set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vim-plug and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call plug#begin()
Plug 'VundleVim/Vundle.vim'
"Plug for colorshemes
"Plug 'kurtpreston/vimcolors'

"Plug for vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug for latex documents
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'matze/vim-tex-fold'
Plug 'xuhdev/vim-latex-live-preview'

"Plug for live pandoc 
Plug 'frabjous/knap'
"syntax
Plug 'ap/vim-css-color' "displays a preview of colors with CSS

"Plug for filesystem explorer
Plug 'preservim/nerdtree'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'kkharji/sqlite.lua'

"Plug for center text
Plug 'junegunn/goyo.vim'

"Plug for smooth scrolling 
Plug 'karb94/neoscroll.nvim'

"Plug for error warning in programming
Plug 'dense-analysis/ale'

"Colorschemes 
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'folke/tokyonight.nvim'
Plug 'Everblush/everblush.nvim', { 'as': 'everblush' }
" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

let mapleader = " "


"Latex options 
let g:livepreview_use_biber= 1
let g:vimtex_view_general_viewer="okular"

"compile python 
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"keybindings 

"Keybindings for tab navigation with leader and number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt

"open and close folds with leader
nnoremap <leader>o zc
"moving between tabs and splits
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vmap <silent> y y:call system("wl-copy", @@)<CR> 
inoremap jj <esc>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fn <cmd>:Telescope frecency<cr>
" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=g
vnoremap J :m '>+1<CR>gv=gv

"logical cursor positioning on lines 
nnoremap j gj
nnoremap k gk

"autocompletion for file names 
inoremap  <C-F> <C-X><C-F>

"autocompletion with dictionary 
inoremap <C-K> <C-X><C-K> 
imap <C-L> <Esc>[s1z=`]a
"pairing characters 
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap " ""<Esc>i

"other mapping 
nnoremap <F4> :wq<CR>
"options 
syntax on
set termguicolors
set relativenumber
set number
syntax enable
set mouse=a
set spell
set wildmenu "tabcompletion everywhere
set spelllang=en_us,it
set tabstop=4
set softtabstop=4
set incsearch
set textwidth=100
set nohlsearch
"set background=dark
set path+=**
set complete+=k

"autosave when focus lost + no error for untitled buffers
:au FocusLost * silent! wa

""""""""""""""""""
" KNAP functions "
""""""""""""""""""
" F5 processes the document once, and refreshes the view "
inoremap <silent> <F5> <C-o>:lua require("knap").process_once()<CR>
vnoremap <silent> <F5> <C-c>:lua require("knap").process_once()<CR>
nnoremap <silent> <F5> :lua require("knap").process_once()<CR>

" F6 closes the viewer application, and allows settings to be reset "
inoremap <silent> <F6> <C-o>:lua require("knap").close_viewer()<CR>
vnoremap <silent> <F6> <C-c>:lua require("knap").close_viewer()<CR>
nnoremap <silent> <F6> :lua require("knap").close_viewer()<CR>

" F7 toggles the auto-processing on and off "
inoremap <silent> <F7> <C-o>:lua require("knap").toggle_autopreviewing()<CR>
vnoremap <silent> <F7> <C-c>:lua require("knap").toggle_autopreviewing()<CR>
nnoremap <silent> <F7> :lua require("knap").toggle_autopreviewing()<CR>

let g:knap_settings = {
    \ "mdoutputext": "pdf",
    \ "mdtopdf" : "pandoc %docroot% -o %outputfile%",
    \ "mdtopdfviewerlaunch": "sioyek %outputfile%",
    \ "mdtopdfviewerrefresh": "none",
\ }

"cursor at x% of the screen
nnoremap zz zz15<c-e>
"colorscheme
"colorscheme PaperColor
"colorscheme Revolution
"colorscheme cyberspace
colorscheme gruvbox
nnoremap <leader>d :set background=dark<CR>
nnoremap <leader>l :set background=light<CR>
nnoremap <leader>t :hi Normal guibg=NONE ctermbg=NONE<CR>
let g:airline_theme='gruvbox'

lua << EOF
require('telescope').load_extension('frecency')
EOF
