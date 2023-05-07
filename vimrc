set encoding=utf-8

call plug#begin(expand('<sfile>:p:h').'/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdtree'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-scripts/mru.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'kburdett/vim-nuuid'
  Plug 'tpope/vim-repeat'
	"Plug 'w0rp/ale'
  Plug 'sheerun/prettier-standard'
  Plug 'haishanh/night-owl.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'

call plug#end()

set vb "stop the ringing!!
set nowrap
set guioptions-=t
set guioptions-=T
set shortmess+=I

set number
set guioptions+=b
set hlsearch
set hidden
"set autoindent
"set cindent
set ignorecase 
set smartcase 
""set incsearch
set tabstop=2 shiftwidth=2 expandtab
let g:NERDTreeChDirMode=2
set fillchars+=vert:│ "solid line


"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

filetype plugin on "for NERDCommenter
filetype plugin indent on

nmap <C-p> :GFiles <cr>
nmap <C-t> :BTags <cr>
nmap <C-T> :Tags <cr>
map <leader>r :Rg<cr>
map <leader>r :Ag<cr>
map <leader>f :BLines<cr>
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

let NERDTreeIgnore = ['.cls.meta.xml$']

" map <F8> :Ack <cword><cr>
map <F8> :Rg <cword><cr>
map <F9> :vim <cword> %<cr>:cwin<cr>

map <F11> :NERDTreeToggle<CR>
map <F12> :TagbarToggle<CR>
map <leader>i :NERDTreeFind<cr>
autocmd BufNewFile,BufRead *.apxc set syntax=apexcode
autocmd BufNewFile,BufRead *.apxt set syntax=apexcode


let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:NERDSpaceDelims = 1
let g:ctrlp_working_path_mode = 0
let g:vim_json_syntax_conceal = 0
let g:coc_global_extensions = ['coc-tsserver']

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

if has("gui_running")
    colorscheme night-owl
    if &diff "maximize if started in diff mode
        au GUIEnter * simalt ~x
        map <A-left> dp
        map <A-right> do
        map <A-up> [c
        map <A-down> ]c
    else
      set lines=35 columns=100
    endif
endif

if has("gui_macvim")
  map <D-j> :CtrlP<CR>
end

if has("win32") || has("win64")
   source $VIMRUNTIME/mswin.vim
   behave mswin

   set directory=$TMP
   set backupdir=c:\temp\vim
   set gfn=Consolas:h12:cANSI 
   "let g:NERDTreeCopyCmd= 'cp -r ' "Fix nerd tree copy menu
   set autowrite
else
   set guifont=Menlo:h18
   set directory=~/.vim__backups//
   set backupdir=~/.vim__backups//
end


" COC Config
set updatetime=300

" imap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

" inoremap <silent><expr> <TAB>
  " \ coc#pum#visible() ? coc#_select_confirm() :
  " \ coc#expandableOrJumpable() ?
  " \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  " \ CheckBackspace() ? "\<TAB>" :
  " \ coc#refresh()

" function! CheckBackspace() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>


