#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v2
  "../common.rkt")
(provide interp-paren-x64)

(define/contract (interp-paren-x64 p)
  (paren-x64-v2? . -> . int64?)
  ; Instead of using the default implementation, you should write your own.
  (interp-paren-x64-v2 p))

(module+ test
  (require rackunit rackunit/text-ui))
