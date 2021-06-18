" Vim-plug
 " set the runtime path to include vim-plug and initialize
 call plug#begin('~/.vim/plugged')

 " Cool status bar
 Plug 'itchyny/lightline.vim'

 " Note taking with MD and HTML
 Plug 'xolox/vim-notes'
 Plug 'xolox/vim-misc'

 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-sensible'

 " plugins for GitHub
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'

 Plug 'michaeljsmith/vim-indent-object'
 Plug 'vim-scripts/ReplaceWithRegister'
 Plug 'kana/vim-textobj-user'
 Plug 'kana/vim-textobj-entire'

 " Async lint engine
 Plug 'w0rp/ale'

 Plug 'ervandew/supertab'
 Plug 'andrewradev/sideways.vim'
 Plug 'jiangmiao/auto-pairs'

 " Nerdtree for file layout
 Plug 'scrooloose/nerdtree'

 " Fuzzy file finder CTRL P
 Plug 'kien/ctrlp.vim'

 " PyCharm/VS Code IDE stuff
 let g:loaded_python_provider = 0
 let g:python3_host_prog = 'C:\Users\anthony.buchholz\AppData\Local\Programs\Python\Python39\python.exe'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
 " Plug 'neoclide/coc-python', { 'do': 'yarn install --frozen-lockfile && yarn build' }
 " Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile && yarn build' }
 " plugin for pycharm extension
 Plug 'beeender/Comrade'

 " plugin from http://vim-scripts.org/vim/scripts.html
 " Plug 'L9'
 " Git plugin not hosted on GitHub
 " Plug 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 " Plug 'file:///home/gmarik/path/to/plugin'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 " Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Install L9 and avoid a Naming conflict if you've already installed a
 " different version somewhere else.
 " Plug 'ascenator/L9', {'name': 'newL9'}

 " All of your Plugs must be added before the following line
 call plug#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line

" end

 set clipboard=unnamed
" Folding
 set foldmethod=indent
 set foldlevel=0
 set modelines=1
" end

 " Sets
 set nocompatible              " be iMproved, required
 filetype off                  " required

 set number relativenumber
 set nu rnu

 syntax on " Syntax highlighting

 set tabstop=4
 set softtabstop=4

 set expandtab

 set shiftwidth=4

 set cursorline " Highlight current line

 set wildmenu

 set foldenable
 set foldlevelstart=5

 set lazyredraw
 set nobackup " We have vcs, we don't need backups.
 set nowritebackup " We have vcs, we don't need backups.

 set ignorecase " case insensitive search
 set smartcase " If there are uppercase letters, become case-sensitive.
 set incsearch " live incremental searching
 set showmatch " live match highlighting
 set hlsearch " highlight matches

 set laststatus=2

 set autoread " Auto update when something else changes it

 set magic " Allows for more common regex

 " Don't have annoying sound on errors
 set noerrorbells

 set background=dark

 set smartcase " Be smart about searching with case

 set path+=** " Enable :find command to be recursive in the current directory

 set ai   " Auto indent
 set si   " Smart indent
 set wrap " Wrap lines

 set list listchars=trail:~,extends:> " Show trailing whitespace as ~

 let mapleader=" "

 if !has('gui_running')
   set t_Co=256
 endif

 set encoding=utf-8
 let g:notes_unicode_enabled = 1
" end

 " Remaps
 inoremap jk <esc>

 tnoremap <Esc> <C-\><C-n>
 nnoremap Y y$
 nnoremap <BS> daW
 nnoremap <CR> o<esc>
 nnoremap <C-A-k> ddkP
 nnoremap <C-A-j> ddp
 nnoremap <silent> <C-A-h> :SidewaysLeft<cr>
 nnoremap <silent> <C-A-l> :SidewaysRight<cr>

 "split navigations
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>

 nmap <leader>n :NERDTreeToggle<CR>

 map <C-n> :NERDTreeToggle<CR>

 map <C-p> :CtrlP<CR>
 " end

 " CoC remap
 nmap <SILENT> gd <Plug>(coc-definition)
 nmap <leader>rn <Plug>(coc-rename)


 function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
   elseif (coc#rpc#ready())
     call CocActionAsync('doHover')
   else
     execute '!' . &keywordprg . " " . expand('<cword>')
   endif
 endfunction

 " Highlight the symbol and its references when holding the cursor.
 autocmd CursorHold * silent call CocActionAsync('highlight')

" Remove trailing whitespace
 function! TrimWhiteSpace()
   %s/\s*$//
   ''
 endfunction

 autocmd FileWritePre * call TrimWhiteSpace()
 autocmd FileAppendPre * call TrimWhiteSpace()
 autocmd FilterWritePre * call TrimWhiteSpace()
 autocmd BufWritePre * call TrimWhiteSpace()
" end
