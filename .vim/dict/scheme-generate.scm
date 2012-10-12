#!/usr/bin/csi -script

(use data-structures extras srfi-1 srfi-4 srfi-13)
(use srfi-14 srfi-69 apropos regex srfi-18 posix utils tcp lolevel)

(call-with-output-file "~/.vim/dict/scheme-word-list"
                       (lambda (port)
                         (for-each (lambda (x) (display x port) (newline port))
                                   (sort (apropos-list (regexp ".*") #:macros? #t)
                                         (lambda (a b)
                                           (string<? (symbol->string a)
                                                      (symbol->string b)))))))
