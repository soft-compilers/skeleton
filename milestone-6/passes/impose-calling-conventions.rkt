#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v6
 "../common.rkt")
(provide impose-calling-conventions)

(define (impose-calling-conventions p)
  (proc-imp-cmf-lang-v6? . -> . imp-cmf-lang-v6?)

  (match p
    [`(module ,procs ... ,tail)
     (error "Unfinished skeleton")]))

(module+ test
  (require rackunit rackunit/text-ui))
