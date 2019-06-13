call plug#begin(expand('<sfile>:p:h').'/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'scrooloose/nerdtree'
  Plug 'chriskempson/base16-vim'
  Plug 'mustache/vim-mustache-handlebars'
  " Plug 'kien/ctrlp.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-scripts/mru.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'pangloss/vim-javascript'
  Plug 'elzr/vim-json'
  Plug 'tpope/vim-repeat'
  Plug 'mileszs/ack.vim'
	Plug 'garbas/vim-snipmate'
	Plug 'tomtom/tlib_vim'
	Plug 'MarcWeber/vim-addon-mw-utils'
	Plug 'honza/vim-snippets'
	Plug 'w0rp/ale'
  Plug 'sheerun/prettier-standard'
" Plug 'chriskempson/base16-vim'
  Plug 'haishanh/night-owl.vim'
  "Plug 'jiangmiao/auto-pairs'
  "Plug '/usr/local/opt/fzf'
  "Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
  Plug 'junegunn/fzf.vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'majutsushi/tagbar'
  Plug 'tpope/vim-surround'
  
  

  if has("win32") || has("win64")
    Plug 'neowit/vim-force.com'
  else
  end
call plug#end()

""syntax enable
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
:inoremap jj <Esc>
:cmap jj <Esc>



"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

filetype plugin on "for NERDCommenter
filetype plugin indent on
au BufNewFile,BufRead *.less set filetype=less

map <leader>at :execute ':ApexTest tooling-async ' . expand('%:r') . '.' . expand('<cword>') <cr>
map <leader>ad :ApexDeployOne<cr>
map <leader>as :ApexScratch<cr>
map <leader>aq :ApexQuery<cr>
map <leader>aa :ApexExecuteAnonymous<cr>
nmap <C-p> :Files <cr>
nmap <C-t> :BTags <cr>
nmap <C-T> :Tags <cr>
map <leader>r :rg<cr>
map <leader>f :BLines<cr>



let NERDTreeIgnore = ['.cls.meta.xml$']
map q <C-w><C-q>
"map <F8> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
"map <F8> :execute "Ack " . expand("<cword>") <CR>
"
" map <F8> :Ack <cword><cr>
map <F8> :Rg <cword><cr>
map <F11> :NERDTreeToggle<CR>
map <F12> :TagbarToggle<CR>
map <leader>i :NERDTreeFind<cr>

let NERDTreeMinimalUI

autocmd BufNewFile,BufRead *.apxc set syntax=apexcode
autocmd BufNewFile,BufRead *.apxt set syntax=apexcode


let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:NERDSpaceDelims = 1
let g:ctrlp_working_path_mode = 0
" let g:syntastic_javascript_checkers=['standard']
" let g:syntastic_javascript_standard_args = "--fix"

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


let g:vim_json_syntax_conceal = 0

let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '⚠'
" let g:ale_sign_warning = '--'

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

function! BackgroundCommandClose(channel) 
  if s:beforeSaveWin == win_getid()
    exec ':e'
  endif
endfunction 

function! JSFix(filename) 
    let s:beforeSaveWin = win_getid()
    let cmd = 'C:\Windows\system32\cmd.exe /c (standard --fix '.expand('%:p').')'
    "let cmd = 'standard --fix '.expand('%:p')
    "let g:backgroundCommandOutput = 'C:\temp\vim\fixoutput.txt'
    "let j2 = job_start(cmd, {'close_cb': 'BackgroundCommandClose', 'out_io': 'file', 'out_name': g:backgroundCommandOutput})                 
    let j2 = job_start(cmd, {'close_cb': 'BackgroundCommandClose'})                 
endfu 


if has("win32") || has("win64")
   source $VIMRUNTIME/mswin.vim
   behave mswin

   set directory=$TMP
   set backupdir=c:\temp\vim
   set gfn=Consolas:h12:cANSI 
   "let g:NERDTreeCopyCmd= 'cp -r ' "Fix nerd tree copy menu
   
   
   "vim force
   let g:apex_messages_split_type = 'split' " split window horizontally
   let g:apex_tooling_force_dot_com_path = "C:\\path\\toolling-force.com.jar\\tooling-force.com-assembly-v0.4.2.0.jar"
   if !exists("g:apex_backup_folder")
     " full path required here, relative may not work
     let g:apex_backup_folder="c:\\temp\\apex\\backup"
   endif
   if !exists("g:apex_temp_folder")
     " full path required here, relative may not work
     let g:apex_temp_folder="c:\\temp\\apex\\gvim-deployment"
   endif
   if !exists("g:apex_properties_folder")
     " full path required here, relative may not work
     let g:apex_properties_folder="c:\\code\\salesforce-sync\\secure-properties"
   endif
   let g:apex_workspace_path="c:\\code\\salesforce-sync"
   set autowrite


else
   set guifont=Menlo:h18
   set directory=~/.vim__backups//
   set backupdir=~/.vim__backups//
"   source ~/Documents/Vim/plugin/snipMate.vim
end
