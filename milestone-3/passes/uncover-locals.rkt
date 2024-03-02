#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v2
  "../common.rkt")
(provide uncover-locals)

(define/contract (uncover-locals p)
  (asm-lang-v2? . -> . asm-lang-v2/locals?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
