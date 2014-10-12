set tabstop=4
set shiftwidth=4

set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0

set expandtab
set title

set nocompatible
set laststatus=2   " Always show the statusline 
set encoding=utf-8 " Necessary to show Unicode glyphs      

set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

color koehler

set guifont=Inconsolata\ 14

set splitbelow
set splitright

let mapleader = " "
let g:EasyMotion_leader_key = "<Leader>"
"""""""""" VUNDLE
let $GIT_SSL_NO_VERIFY = 'true'

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'christoomey/vim-tmux-navigator'

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'

Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'

Bundle 'mileszs/ack.vim'

Bundle 'Valloric/YouCompleteMe'
"Bundle 'Lokaltog/powerline'

Bundle 'Lokaltog/powerline-fonts'
Bundle 'bling/vim-airline'

Bundle 'scrooloose/nerdtree'

Plugin 'KabbAmine/zeavim.vim' 

filetype plugin indent on

"""""""""" VUNDLE END

nnoremap <leader>jd :YcmCompleter GoTo<CR>

"let g:ycm_global_ycm_extra_conf = '/bb/mbigd/mbig1265/.ycm_extra_conf.py'
"let g:ycm_path_to_python_interpreter = '/opt/swt/bin/python2.7'
"let g:ycm_path_to_python_interpreter = '/bb/bin/bbpy2.7'
"
"let g:ycm_filetype_whitelist = { 'cpp': 0, 'py': 1, 'h': 0} 

let g:ycm_server_log_level = 'debug'
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_confirm_extra_conf = 0



"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#completion_enabled = 0

"let g:airline_powerline_fonts = 1

syntax on
"source ~/.vim/skunk_cursor.vim

"map <c-b> :CtrlPBuffer<CR>

set  completeopt=preview,menuone,longest

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(d|so|o)$',
  \ 'link': '',
  \ }

set tags+=tags
set nu 

"#set complete-=i
filetype plugin on
"set ofu=syntaxcomplete#Complete

set wildmenu
set wildmode=list:longest:full

set bs=2		" allow backspacing over everything in insert mode

set ai			" always set autoindenting on
set smartindent

set cino=g0		"C/C++ auto-indent"
set cino+=N-s "

set noerrorbells "damn this beep  ;-)" to quote Sven's rc.
set showcmd
set showmatch

" ================ Search Settings  =================
set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


let NERDTreeIgnore = [ '\.o', '\.d']
map <F2> :NERDTreeToggle<CR>
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R Åc++-kinds=+p Åfields=+iaS Åextra=+q .<CR>

function! MoveFile(newspec)
     let old = expand('%')
     if (old == a:newspec)
         return 0
     endif
     exe 'sav' fnameescape(a:newspec)
     call delete(old)
endfunction

command! -nargs=1 -complete=file -bar MoveFile call MoveFile('<args>')
