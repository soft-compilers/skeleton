#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide interp-values-lang)

(define/contract (interp-values-lang p)
  (values-lang-v4? . -> . int64?)
  ; Instead of using the default implementation, you should write your own.
  (interp-values-lang-v4 p))

(module+ test
  (require rackunit rackunit/text-ui))
