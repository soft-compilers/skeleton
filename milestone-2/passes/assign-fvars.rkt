#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v2
  "../common.rkt")
(provide assign-fvars)

(define/contract (assign-fvars p)
  (asm-lang-v2/locals? . -> . asm-lang-v2/assignments?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
