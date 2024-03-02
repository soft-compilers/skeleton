#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v3
 "../common.rkt")
(provide normalize-bind)

(define/contract (normalize-bind p)
  (imp-mf-lang-v3? . -> . imp-cmf-lang-v3?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
