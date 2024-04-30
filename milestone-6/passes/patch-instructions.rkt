#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide patch-instructions)

(define/contract (patch-instructions p)
  (para-asm-lang-v6? . -> . paren-x64-v6?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
