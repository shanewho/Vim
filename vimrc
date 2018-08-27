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
"set autoindent
"set cindent
set ignorecase 
set smartcase 
set incsearch
set tabstop=2 shiftwidth=2 expandtab
let g:NERDTreeChDirMode=2

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

filetype plugin on "for NERDCommenter
filetype plugin indent on
au BufNewFile,BufRead *.less set filetype=less

map <F6> SyntasticCheck<CR>
map <F8> :NERDTreeToggle %<CR>
"map <F8> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
"map <F8> :execute "Ack " . expand("<cword>") <CR>
map <F8> :Ack <cword><cr>
map <F9> :TlistToggle %<CR>
map <F11> :NERDTreeToggle<CR>
map <leader>i :NERDTreeFind<cr>

autocmd BufNewFile,BufRead *.apxc set syntax=apexcode
autocmd BufNewFile,BufRead *.apxt set syntax=apexcode


let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:NERDSpaceDelims = 1
let g:ctrlp_working_path_mode = 0
let g:syntastic_javascript_checkers=['standard']
let g:syntastic_javascript_standard_args = "--fix"
let g:ale_lint_on_text_changed = 'never'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


let g:vim_json_syntax_conceal = 0

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
   let g:NERDTreeCopyCmd= 'cp -r ' "Fix nerd tree copy menu

   command! -bang -nargs=* -complete=file JSFix call JSFix(<q-args>) 
   :autocmd BufWritePost *.js :JSFix
else
   set guifont=Menlo:h18
   set directory=~/.vim__backups//
   set backupdir=~/.vim__backups//
"   source ~/Documents/Vim/plugin/snipMate.vim
end
