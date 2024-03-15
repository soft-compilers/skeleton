#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide uncover-locals)

(define/contract (uncover-locals p)
  (asm-pred-lang-v4? . -> . asm-pred-lang-v4/locals?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
