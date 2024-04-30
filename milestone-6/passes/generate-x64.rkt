#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v6
 "../common.rkt")
(provide generate-x64)

(define/contract (generate-x64 p)
  (paren-x64-v6? . -> . string?)

  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
