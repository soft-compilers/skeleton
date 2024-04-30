#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide link-paren-x64)

(define/contract (link-paren-x64 p)
  (paren-x64-v4? . -> . paren-x64-rt-v4?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
