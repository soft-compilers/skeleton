#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v5
  "../common.rkt")
(provide check-values-lang)

(define (check-values-lang p)
  ; Check for well-formedness of p instead of simply giving it back.
  p)

(module+ test
  (require rackunit rackunit/text-ui))
