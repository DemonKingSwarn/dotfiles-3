" truecolor
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Install Plugged
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugged
call plug#begin(expand('~/.local/share/nvim/plugged'))
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'andweeb/presence.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
call plug#end()


" UI
set autoindent
set expandtab
set number relativenumber
colorscheme dracula
set background=dark
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
highlight VertSplit ctermbg=NONE guibg=NONE

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4

set mouse=a

" Use the system clipboard
set clipboard=unnamedplus

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
