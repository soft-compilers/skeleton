#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v2
  "../common.rkt")
(provide patch-instructions)

(define/contract (patch-instructions p)
  (para-asm-lang-v2? . -> . paren-x64-fvars-v2?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
