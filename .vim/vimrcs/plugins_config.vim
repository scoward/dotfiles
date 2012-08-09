""""""""""""""""""""""""""""""""
" => bufExplorer
""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>b :BufExplorer<cr>

nnoremap <leader>p :bp<cr>
nnoremap <leader>n :bn<cr>

""""""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""""""
map <leader>4 :NERDTreeToggle<cr>
map <leader>tb :NERDTreeFromBookmark
map <leader>tf :NERDTreeFind<cr>

""""""""""""""""""""""""""""""""
" => VimClojure + Nailgun
""""""""""""""""""""""""""""""""
" Let's remember some things, like where the .vim folder is.
if has("win32") || has("win64")
    let windows=1
    let vimfiles=$HOME . "/vimfiles"
    let setp=";"
else
    let windows=0
    let vimfiles=$HOME . "/.vim"
    let sep=":"
endif

let classpath = join(
    \[".",
    \ "src", "src/main/clojure", "src/main/resources",
    \ "test", "src/test/clojure", "src/test/resources",
    \ "classes", "target/classes",
    \ "lib/*", "lib/dev/*",
    \ "bin",
    \ vimfiles."/lib/*"
    \],
    \ sep)

" Actual VimClojure settings
let vimclojureRoot = vimfiles."/bundle/vimclojure"
let vimclojure#HighlightBuiltins=1
let vimclojure#HightlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
"let vimclojure#WantNailgun=1
"let vimclojure#NailgunClient= vimclojureRoot."/lib/nailgun/ng"
"if windows
"    let vimclojure#Nailgun = substitute(vimclojure#NailgunClient, "/", "\\", "g"). ".exe"
"endif

" Start vimclojure nailgun server (uses screen.vim to manage lifetime)
"nmap <silent> <Leader>sc :execute "ScreenShell java -cp \"" . classpath . sep . vimclojureRoot . "/lib/*" . "\" vimclojure.nailgun.NGServer 127.0.0.1" <cr>
" Start a generic Clojure repl (uses screen.vim)
"nmap <silent> <Leader>sC :execute "ScreenShell java -cp \"" . classpath . "\" clojure.main" <cr>
