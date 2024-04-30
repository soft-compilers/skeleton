#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide trace-schedule)

(define/contract (trace-schedule p)
  (block-asm-lang-v6? . -> . block-asm-lang-v6?)

  ; Instead of just passing back the input, you should
  ; implement the optimization. 
  p)

(module+ test
  (require rackunit rackunit/text-ui))
