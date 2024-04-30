#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide implement-fvars)

(define/contract (implement-fvars p)
  (nested-asm-lang-fvars-v6? . -> . nested-asm-lang-v6?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
