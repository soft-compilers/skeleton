#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v4
 "../common.rkt")
(provide normalize-bind)

(define/contract (normalize-bind p)
  (imp-mf-lang-v4? . -> . imp-cmf-lang-v4?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
