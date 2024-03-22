#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v5
  "../common.rkt")
(provide uncover-locals)

(define/contract (uncover-locals p)
  (asm-pred-lang-v5? . -> . asm-pred-lang-v5/locals?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
