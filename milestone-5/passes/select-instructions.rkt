#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v5
 "../common.rkt")
(provide select-instructions)

(define/contract (select-instructions p)
  (imp-cmf-lang-v5? . -> . asm-pred-lang-v5?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
