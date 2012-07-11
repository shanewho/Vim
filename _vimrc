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

command -nargs=* FF :execute "vimgrep /" . expand("<args>") . "/j **" <BAR> cw
map <F6> :q<CR>
map <F8> :NERDTreeToggle %<CR>
map <F8> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F9> :TlistToggle %<CR>
map <F11> :NERDTreeToggle<CR>

if has("gui_running")
  colorscheme wombat
  set lines=35 columns=100
endif

if has("win32") || has("win64")
   set tabstop=4 shiftwidth=4 expandtab
   set directory=$TMP
   set backupdir=c:\temp\vim
   set gfn=Consolas:h12:cANSI
else
   set guifont=Menlo:h18
   set directory=~/.vim/__backups//
   set backupdir=~/.vim/__backups//
   set tabstop=2 shiftwidth=2 expandtab
end
