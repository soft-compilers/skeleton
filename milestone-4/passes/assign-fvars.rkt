#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide assign-fvars)

(define/contract (assign-fvars p)
  (asm-pred-lang-v4/locals? . -> . asm-pred-lang-v4/assignments?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
