#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v4
 "../common.rkt")
(provide generate-x64)

(define/contract (generate-x64 p)
  (paren-x64-v4? . -> . string?)

  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
