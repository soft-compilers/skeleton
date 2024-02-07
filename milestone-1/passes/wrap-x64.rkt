#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v1)
(provide
  wrap-x64-run-time
  wrap-x64-boilerplate)

(define/contract (wrap-x64-run-time str)
  (string? . -> . string?)
  (error "Unfinished skeleton"))

(define/contract (wrap-x64-boilerplate str)
  (string? . -> . string?)
  (error "Unfinished skeleton"))

;; No need to test here
;(module+ test
;  (require rackunit rackunit/text-ui))
