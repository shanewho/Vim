execute pathogen#infect()
 
syntax enable
set vb "stop the ringing!!
set nowrap
set guioptions-=t
set guioptions-=T
set shortmess+=I

set number
set guioptions+=b
set hlsearch
set hidden
set autoindent
set cindent
set ignorecase 
set smartcase 
set incsearch
set tabstop=4 shiftwidth=4 expandtab
let g:NERDTreeChDirMode=2

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

filetype plugin on "for NERDCommenter
au BufNewFile,BufRead *.less set filetype=less

map <F6> SyntasticCheck<CR>
map <F8> :NERDTreeToggle %<CR>
"map <F8> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
"map <F8> :execute "Ack " . expand("<cword>") <CR>
map <F8> :Ack <cword><cr>
map <F9> :TlistToggle %<CR>
map <F11> :NERDTreeToggle<CR>
map <leader>i :NERDTreeFind<cr>

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:ctrlp_working_path_mode = 0
let g:syntastic_javascript_checkers=['eslint']

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


if has("gui_running")
    colorscheme base16-ocean
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
   set directory=$TMP
   set backupdir=c:\temp\vim
   set gfn=Consolas:h12:cANSI 
else
   set guifont=Menlo:h18
   set directory=~/.vim__backups//
   set backupdir=~/.vim__backups//
"   source ~/Documents/Vim/plugin/snipMate.vim
end
