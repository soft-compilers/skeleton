#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide implement-fvars)

(define/contract (implement-fvars p)
  (paren-x64-fvars-v4? . -> . paren-x64-v4?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
