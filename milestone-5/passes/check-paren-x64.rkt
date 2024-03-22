#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide check-paren-x64)

(define/contract (check-paren-x64 p)
  (any/c . -> . paren-x64-v4?)
  ; Check for well-formedness of p instead of simply giving it back.
  p)

(module+ test
  (require rackunit rackunit/text-ui))
