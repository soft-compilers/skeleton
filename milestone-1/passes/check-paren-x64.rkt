#lang racket

(require
  ; provides register? int64? int32? ....
  cpsc411/compiler-lib
  cpsc411/langs/v1
  "../common.rkt")
(provide check-paren-x64)

;; if you choose not to complete, implement a stub that returns the input
(define (check-paren-x64-syntax p)
  (error "Unfinished skeleton"))

;; if you choose not to complete, implement a stub that returns the input
(define (check-paren-x64-init p)
  (error "Unfinished skeleton"))

(define/contract (check-paren-x64 p)
  (any/c . -> . paren-x64-v1?)
  (check-paren-x64-init (check-paren-x64-syntax p)))

(module+ test
  (require rackunit rackunit/text-ui))
