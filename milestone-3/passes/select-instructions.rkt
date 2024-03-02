#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v2
 cpsc411/langs/v3
 "../common.rkt")
(provide select-instructions)

(define/contract (select-instructions p)
  (imp-cmf-lang-v3? . -> . asm-lang-v2?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
