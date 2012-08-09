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
