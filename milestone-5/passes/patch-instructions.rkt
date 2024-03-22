#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v5
  "../common.rkt")
(provide patch-instructions)

(define/contract (patch-instructions p)
  (para-asm-lang-v5? . -> . paren-x64-fvars-v5?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
