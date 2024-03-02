#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v2
  "../common.rkt")
(provide implement-fvars)

(define/contract (implement-fvars p)
  (paren-x64-fvars-v2? . -> . paren-x64-v2?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
