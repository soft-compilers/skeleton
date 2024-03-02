#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v2
  "../common.rkt")
(provide check-paren-x64)

(define (check-paren-x64-syntax p)
  (error "Unfinished skeleton"))

(define (check-paren-x64-init p)
  (error "Unfinished skeleton"))

(define (check-paren-x64 p)
  (check-paren-x64-init (check-paren-x64-syntax p)))

(module+ test
  (require rackunit rackunit/text-ui))
