#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide uncover-locals)

(define/contract (uncover-locals p)
  (asm-pred-lang-v6? . -> . asm-pred-lang-v6/locals?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
