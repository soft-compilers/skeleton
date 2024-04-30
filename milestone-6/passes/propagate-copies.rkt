#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide propagate-copies)

(define/contract (propagate-copies p)
  (proc-imp-cmf-lang-v6? . -> . proc-imp-cmf-lang-v6?)

  ; Instead of just passing back the input, you should
  ; implement the optimization. 
  p)
  
(module+ test
  (require rackunit rackunit/text-ui))
