#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v5
  "../clean-proc-imp-cmf-lang.rkt"
  "../common.rkt")
(provide bury-dead)

(define/contract (bury-dead p)
  (proc-imp-cmf-lang-v5? . -> . proc-imp-cmf-lang-v5?)

  ; Instead of just passing back the input, you should
  ; implement the optimization. 
  (clean-proc-imp-cmf-lang p))

(module+ test
  (require rackunit rackunit/text-ui))
