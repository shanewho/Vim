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
let g:NERDTreeChDirMode=2

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

filetype plugin on "for NERDCommenter

command -nargs=* FF :execute "vimgrep /" . expand("<args>") . "/j **" <BAR> cw
command FLE :%s/\r\+$//e
map <F6> :q<CR>
map <F8> :NERDTreeToggle %<CR>
map <F8> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F9> :TlistToggle %<CR>
map <F11> :NERDTreeToggle<CR>

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

if has("gui_running")
  "colorscheme wombat
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
   set tabstop=4 shiftwidth=4 expandtab
   set directory=$TMP
   set backupdir=c:\temp\vim
   set gfn=Consolas:h12:cANSI 

   "TFS checkout on buffer modified
   function! Tfcheckout()        
       :let tf = system('"C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\tf.exe" checkout ' . expand('%:p'))        
       set invreadonly    
   endfunction

   autocmd FileChangedShell * echohl WarningMsg | echo "File was updated outside of VIM" | echohl None
   au FileChangedRO * :call Tfcheckout()
   "######
   
else
   set guifont=Menlo:h18
   set directory=~/.vim/__backups//
   set backupdir=~/.vim/__backups//
   set tabstop=2 shiftwidth=2 expandtab
   source ~/Documents/Vim/plugin/snipMate.vim
end
