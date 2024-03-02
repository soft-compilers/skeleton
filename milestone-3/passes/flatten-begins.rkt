#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v2
  "../common.rkt")
(provide flatten-begins)

(define/contract (flatten-begins p)
  (nested-asm-lang-v2? . -> . para-asm-lang-v2?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
