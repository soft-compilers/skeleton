#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v5
 "../common.rkt")
(provide normalize-bind)

(define/contract (normalize-bind p)
  (imp-mf-lang-v5? . -> . proc-imp-cmf-lang-v5?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
