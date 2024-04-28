#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide trace-schedule)

(define/contract (trace-schedule p)
  (block-asm-lang-v4? . -> . block-asm-lang-v4?)

  ; Instead of just passing back the input, you should
  ; implement the optimization. 
  p)

(module+ test
  (require rackunit rackunit/text-ui))
