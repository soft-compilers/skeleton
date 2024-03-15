#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v4
 "../common.rkt")
(provide select-instructions)

(define/contract (select-instructions p)
  (imp-cmf-lang-v4? . -> . asm-pred-lang-v4?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
