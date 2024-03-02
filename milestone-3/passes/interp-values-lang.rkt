#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v3
  "../common.rkt")
(provide interp-values-lang)

(define/contract (interp-values-lang p)
  (values-lang-v3? . -> . int64?)
  ; Instead of using the default implementation, you should write your own.
  (interp-values-lang-v3 p))

(module+ test
  (require rackunit rackunit/text-ui))
