" Vim filetype plugin
" Language:      Scheme
" Maintainer:    Sergey Khorev <sergey.khorev@gmail.com>
" URL:		 http://sites.google.com/site/khorser/opensource/vim
" Original author:    Dorai Sitaram <ds26@gte.com>
" Original URL:		 http://www.ccs.neu.edu/~dorai/vimplugins/vimplugins.html
" Last Change:   Jan 9, 2012

let g:is_chicken=1

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Copy-paste from ftplugin/lisp.vim
setl comments=:;
setl define=^\\s*(def\\k*
setl formatoptions-=t
setl iskeyword+=+,-,*,/,%,<,=,>,:,$,?,!,@-@,94
setl lisp

" make comments behaviour like in c.vim
" e.g. insertion of ;;; and ;; on normal "O" or "o" when staying in comment
setl comments^=:;;;,:;;,sr:#\|,mb:\|,ex:\|#
setl formatoptions+=croql

" Scheme-specific settings
if exists("b:is_mzscheme") || exists("is_mzscheme")
    " improve indenting
    setl iskeyword+=#,%,^
    setl lispwords+=module,parameterize,let-values,let*-values,letrec-values
    setl lispwords+=define-values,opt-lambda,case-lambda,syntax-rules,with-syntax,syntax-case
    setl lispwords+=define-signature,unit,unit/sig,compund-unit/sig,define-values/invoke-unit/sig
endif

if exists("b:is_chicken") || exists("is_chicken")
    " improve indenting
    setl iskeyword+=#,%,^
    setl lispwords+=let-optionals,let-optionals*,declare
    setl lispwords+=let-values,let*-values,letrec-values
    setl lispwords+=define-values,opt-lambda,case-lambda,syntax-rules,with-syntax,syntax-case
    setl lispwords+=cond-expand,and-let*,foreign-lambda,foreign-lambda*
    setl lispwords+=let-values,condition-case,with-input-from-string
    setl lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
    setl lispwords+=call-with-output-file

    " completion
    setl complete+=,k~/.vim/dict/scheme-word-list
    setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
    setl includeexpr=substitute(v:fname,'$','.scm','')
    setl path+=/var/lib/chicken/6
    setl suffixesadd=.scm
endif

nmap &lt;silent&gt; == :call Scheme_indent_top_sexp()&lt;cr&gt;

" Indent a toplevel sexp.
fun! Scheme_indent_top_sexp()
    let pos = getpos('.')
    silent! exec "normal! 99[(=%"
    call setpos('.', pos)
endfun

