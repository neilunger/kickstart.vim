"
" =====================================================================
" ========                                    .-----.          ========
" ========         .----------------------.   | === |          ========
" ========         |.-""""""""""""""""""-.|   |-----|          ========
" ========         ||                    ||   | === |          ========
" ========         ||   KICKSTART.VIM    ||   |-----|          ========
" ========         ||                    ||   | === |          ========
" ========         ||                    ||   |-----|          ========
" ========         ||:!vimtutor          ||   |:::::|          ========
" ========         |'-..................-'|   |____o|          ========
" ========         `"")----------------(""`   ___________      ========
" ========        /::::::::::|  |::::::::::\  \ no mouse \     ========
" ========       /:::========|  |==hjkl==:::\  \ required \    ========
" ========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
" ========                                                     ========
" =====================================================================
"
" Kickstart.vim is a starting point for your Vim configuration,
" heavily inspired by Kickstart.nvim.
"
" If you are using Neovim, you should use Kickstart.nvim instead:
" https://github.com/nvim-lua/kickstart.nvim
" (use `gx` keybinding to open the link)
"
" If you have any question while reading the .vimrc,
" you should use Vim's built-in help, triggered by `:help X`.
" We also provide a keymap "<space>sh" [s]earch [h]elp documentation.
"


" Set <space> as the leader key
" See `:help mapleader`
let mapleader=' '
let maplocalleader = ' '


" [[ Setting Neovim default options ]]
" These are some of the options enabled by default in Neovim
" These are options believed by many Vim users to be essential.
" For more information, see `:h vim_diff.txt` in Neovim
filetype on
syntax on
set autoindent autoread background=dark
set backspace=indent,eol,start belloff=all
set display=lastline encoding=utf-8 hidden
set history=10000 incsearch
set nojoinspaces laststatus=2 ruler
set showcmd smarttab nostartofline
set switchbuf=uselast wildmenu "wildoptions=pum,tagfile

" [[ Settings other options ]]
" See `:help :set`
" NOTE: You can change these options as you wish!
"  For more options, you can see `:help option-list`

" Make line numbers default
set number
" You can also add relative line numbers, to help with jumping.
"  Experiment for yourself to see if you like it!
set relativenumber

" Enable mouse mode, can be useful for resizing splits for example!
set mouse=a

" Don't show the mode, since it's already in the status line
set noshowmode

" Sync clipboard between OS and Vim.
"  Remove this option if you want your OS clipboard to remain independent.
"  See `:help 'clipboard'`
set clipboard=unnamedplus

" Enable break indent
set breakindent

" Save undo history
"  By default, undo files (.file.txt.un~) are saved in the current directory.
"  This makes the file system very messy, so undofile is disabled by default.
"
"  If would like to enable undofile, I recommend you to change undodir:
"  1. Create the undo directory: `:! mkdir -p ~/.local/state/vim/undo`
"  2. Uncomment the following line starting with "set undodir" and save the file
"  3. Source the .vimrc: `:source ~/.vimrc`
"  4. Now undo history will persist between Vim sessions
"
"  NOTE: See `:help undofile` and `:help undodir` for more information
"    You may change the undodir to another directory you prefer
set undodir=~/.local/state/vim/undo//
set undofile

" Case-insensitive searching UNLESS \C or capital in search
set ignorecase
set smartcase

" Keep signcolumn on by default
set signcolumn=yes

" Decrease update time
set updatetime=250

" Decrease mapped sequence wait time
" Displays vim-which-key sooner
set timeoutlen=300

" Configure how new splits should be opened
set splitright
set splitbelow

" Sets how Vim will display certain whitespace characters in the editor.
set list
set listchars=tab:»\ ,trail:·,nbsp:␣
" Use the following settings if you do not want unicode characters
"set listchars=tab:>\ ,trail:-,nbsp:+

" Show which line your cursor is on
set cursorline

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
" instead raise a dialog asking if you wish to save the current file(s)
" See `:help 'confirm'`
set confirm


" [[ Basic Keymaps ]]

" Set highlight on search, but clear on pressing <Esc> twice in normal mode
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR>

" Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
" for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
" is not what someone will guess without a bit more experience.
"
" NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
" or just use <C-\><C-n> to exit terminal mode
tnoremap <Esc><Esc> <C-\><C-n>

" Remap for dealing with word wrap
nnoremap <expr> <silent> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> <silent> j v:count == 0 ? 'gj' : 'j'

" TIP: Disable arrow keys in normal mode
nnoremap <left> :echo "Use h to move!!"<CR>
nnoremap <right> :echo "Use l to move!!"<CR>
nnoremap <up> :echo "Use k to move!!"<CR>
nnoremap <down> :echo "Use j to move!!"<CR>

" Keybinds to make split navigation easier.
"  Use CTRL+<hjkl> to switch between windows
"
"  See `:help wincmd` for a list of all window commands
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>


" [[ Install `vim-plug` plugin manager ]]
"    See https://github.com/junegunn/vim-plug/ for more info
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" [[ Install plugins ]]
"  To check the current status of your plugins, run
"    :PlugStatus
"
"  To update plugins you can run
"    :PlugUpdate
"
" Note: Here is where you install your plugins.
call plug#begin()
" Detect tabstop and shiftwidth automatically
Plug 'tpope/vim-sleuth'

" "gc" to comment visual regions/lines
Plug 'tpope/vim-commentary'

" Adds git related signs to the gutter
Plug 'airblade/vim-gitgutter'

" Useful plugin to show you pending keybinds.
Plug 'liuchengxu/vim-which-key'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Enable LSP
Plug 'prabirshrestha/vim-lsp'
" Install language servers and configure them for vim-lsp
Plug 'mattn/vim-lsp-settings'

" Autocompletion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Colorscheme
Plug 'gruvbox-community/gruvbox'

" Set airline as statusline
Plug 'vim-airline/vim-airline'

" Plugin for trimming whitespace
Plug 'ntpeters/vim-better-whitespace'
call plug#end()


" [[ Configure plugins ]]
" Set colorscheme
set termguicolors
colorscheme gruvbox


" [[ Configure vim-which-key ]]
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '<Space>'<CR>

" Document existing key chains
let g:which_key_map =  {}
let g:which_key_map.s = { 'name' : '[S]earch' }
let g:which_key_map.h = { 'name' : 'Git [H]unk' }


" [[ Configure fzf.vim ]]
" See `:help fzf-vim`

nmap <leader>sh :Helptags<CR>
let g:which_key_map.s.h = '[S]earch [H]elp'
nmap <leader>sk :Maps<CR>
let g:which_key_map.s.k = '[S]earch [K]eymaps'
nmap <leader>sf :Files<CR>
let g:which_key_map.s.f = '[S]earch [F]iles'
nmap <leader>sg :Rg<CR>
let g:which_key_map.s.g = '[S]earch by [G]rep'
nmap <leader>s. :History<CR>
let g:which_key_map.s['.'] = '[S]earch Recent Files ("." for repeat)'
nmap <leader><leader> :Buffers<CR>
let g:which_key_map[' '] = '[ ] Find existing buffers'

nmap <leader>/ :BLines<CR>
let g:which_key_map['/'] = '[/] Fuzzily search in current buffer'


" [[ Configure LSP ]]
" NOTE: Install new language server using `:LspInstallServer` in the filetype
" you are trying to install LSP for.
" For example, if you want LSP server for C/C++, type
" `:LspInstallServer clangd` in a C/C++ buffer.

" Performance related settings, requires Vim 8.2+
let g:lsp_use_native_client = 1
let g:lsp_semantic_enabled = 1

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  " Keymaps
  " These keybindings are default in Neovim
  nnoremap <buffer> [d <plug>(lsp-previous-diagnostic)
  nnoremap <buffer> ]d <plug>(lsp-next-diagnostic)
  " See `:help K` for why this keymap
  nnoremap <buffer> K <plug>(lsp-hover)
  nnoremap <buffer> grn <plug>(lsp-rename)
  nnoremap <buffer> gra <plug>(lsp-code-action-float)
  nnoremap <buffer> grr <plug>(lsp-references)
  nnoremap <buffer> gri <plug>(lsp-implementation)
  nnoremap <buffer> gO <plug>(lsp-document-symbol-search)
  nnoremap <buffer> <C-s> <plug>(lsp-signature-help)

  " Other useful functions
  nnoremap <buffer> grd <plug>(lsp-definition)
  " In C, this would take you to the header file
  nnoremap <buffer> grD <plug>(lsp-declaration)
  nnoremap <buffer> grt <plug>(lsp-peek-type-definition)
  nnoremap <buffer> gW <plug>(lsp-workspace-symbol-search)

  " Formatting
  let g:lsp_format_sync_timeout = 1000
  nnoremap <buffer> <leader>f <plug>(lsp-document-format)
  let g:which_key_map.f = '[F]ormat buffer'
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" [[ Configure completion ]]
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>""

let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" [[ Configure better whitespace]]
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1


" The line beneath this is called `modeline`. See `:help modeline`
" vim: ts=2 sts=2 sw=2 et
