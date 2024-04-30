#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide inline-jumps)

(define/contract (inline-jumps p)
  (para-asm-lang-v6? . -> . para-asm-lang-v6?)

  ; Instead of just passing back the input, you should
  ; implement the optimization. 
  p)

(module+ test
  (require rackunit rackunit/text-ui))
