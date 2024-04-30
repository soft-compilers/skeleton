#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v6
 "../common.rkt")
(provide normalize-bind)

(define/contract (normalize-bind p)
  (imp-mf-lang-v6? . -> . proc-imp-cmf-lang-v6?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
