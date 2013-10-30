" ============================================================================
" File:        gundo.vim
" Description: vim global plugin to visualize your undo tree
" Maintainer:  Steve Losh <steve@stevelosh.com>
" License:     GPLv2+ -- look it up.
" Notes:       Much of this code was thiefed from Mercurial, and the rest was
"              heavily inspired by scratch.vim and histwin.vim.
"
" ============================================================================


"{{{ Misc
command! -nargs=0 R :PcfR
command! -nargs=0 T :PcfT
command! -nargs=0 PcfT :call <SID>RelatedTest()
command! -nargs=0 PcfR :call <SID>RelatedView()
map <F2> :so C:\Users\sblazek\Documents\vim\plugin\pcf.vim<CR>
map <F3> :PcfR<CR>
map <F4> :PcfT<CR>
"map <F4> :call <SID>RunTests()<CR>
"}}}

function! s:RelatedView()"{{{
    let related = s:GetRelatedView(expand('%:p'))
    exec('e ' . related)
endfunction"}}}

function! s:RelatedTest()"{{{
    let related = s:GetRelatedTest(expand('%:p'))
    echo related
    "return
    exec('e ' . related)
endfunction"}}}

function! s:GetRelatedTest(file)
  if match(a:file, '.*Spec.js') >=# 0
    let name = substitute(a:file, '\v(.*)\\Test\\.*\\(.*)Spec.js$', '\2', '')
    let path = substitute(a:file, '\v(.*)\\Test\\.*\\(.*)Spec.js$', '\1\\', '')

    let matches = split(globpath(path, '**\' . name . '.js'), '\n')
    if len(matches) == 0
        return ''
    endif
    if len(matches) > 1 
        let match = matches[len(matches)-1]
    else
        let match = matches[0]
    endif

    if match !=# a:file
      return match
    endif
  elseif match(a:file, '\v\.js') >=# 0
    let name = substitute(a:file, '\v(.*)\\src\\.*\\(.*).js$', '\2Spec.js', '')
    let path = substitute(a:file, '\v(.*)\\src\\.*\\(.*).js$', '\1\\test', '')

    let matches = split(globpath(path, '**\' . name), '\n')
    if len(matches) == 0
        return ''
    endif
    if len(matches) > 1 
        let match = matches[len(matches)-1]
    else
        let match = matches[0]
    endif

    if match !=# a:file
      return match
    endif
  endif

  return ''
endfunction

function! s:GetRelatedView(file)
  if match(a:file, 'js\\views') >=# 0
    let path = substitute(a:file, '\vjs\\views\\(.*)View.js$', 'content\\\1.html', '')
    if !filereadable(path)
        let path = substitute(a:file, '\vjs\\views\\(.*)View.js$', 'content\\\1View.html', '')
    endif
    if path !=# a:file
      return path
    endif
  elseif match(a:file, 'content.*\.html') >=# 0
    let path = substitute(a:file, '\vcontent(.*)\.html$', 'js\\views\1View.js', '')
    if !filereadable(path)
        let path = substitute(a:file, '\vcontent(.*)\.html$', 'js\\views\1.js', '')
    endif
    if path !=# a:file
      return path
    endif
  endif

  return ''
endfunction

" Unit Tests!
function! s:RunTests()
  let s:test_number = 0
  let s:passes = 0

  echo "Test s:GetRelatedView"
  " Not in the proper format
  call s:Equals('', s:GetRelatedView('blah.php'))
  " Proper format, source file
  call s:Equals('E:\Dev\ClientLibrary_Shell\Future\src\content\appBar.html', s:GetRelatedView('E:\Dev\ClientLibrary_Shell\Future\src\js\views\appBarView.js'))
  call s:Equals('E:\Dev\ClientLibrary_Shell\Future\src\js\views\appBarView.js', s:GetRelatedView('E:\Dev\ClientLibrary_Shell\Future\src\content\appBar.html'))

  echo "Test s:OpenCommand"
  "call s:Equals('vsplit', s:OpenCommand('vs'))
  "call s:Equals('split', s:OpenCommand('sp'))
  "call s:Equals('edit', s:OpenCommand('e'))
  " Defaults to vsplit
  "call s:Equals('vsplit', s:OpenCommand(''))
  "call s:Equals('vsplit', s:OpenCommand('does-not-exist'))

  "echo printf("\nFinished test suite - %d of %d tests passed (%d%%)", s:passes, s:test_number, s:passes*100/s:test_number)
endfunction

function! s:Equals(expect, actual)
  let s:test_number = s:test_number + 1

  if a:expect ==# a:actual
    echo printf("%10s %s", "Test " . s:test_number . ":", "PASS")
    let s:passes = s:passes + 1
  else
    echo printf("%10s %s", "Test " . s:test_number . ":", "FAIL")
    echo printf("%20s %s", "Expected:", a:expect)
    echo printf("%20s %s", "Actual:", a:actual)
  endif
endfunction




