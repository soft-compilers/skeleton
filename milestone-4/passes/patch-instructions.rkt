#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide patch-instructions)

(define/contract (patch-instructions p)
  (para-asm-lang-v4? . -> . paren-x64-fvars-v4?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
