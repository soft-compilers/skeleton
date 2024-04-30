#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v6
 "../common.rkt")
(provide select-instructions)

(define/contract (select-instructions p)
  (imp-cmf-lang-v6? . -> . asm-pred-lang-v6?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
