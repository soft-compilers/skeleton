#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v5
 "../common.rkt")
(provide impose-calling-conventions)

(define/contract (impose-calling-conventions p)
  (proc-imp-cmf-lang-v5? . -> . imp-cmf-lang-v5?)

  (match p
    [`(module ,procs ... ,tail)
     (error "Unfinished skeleton")]))

(module+ test
  (require rackunit rackunit/text-ui))
