#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/graph-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide assign-registers)

(define/contract (assign-registers p)
  (asm-pred-lang-v4/conflicts? . -> . asm-pred-lang-v4/assignments?)

  (define (update-info info tail)
    (define locals (info-ref info 'locals))
    (define conflicts (info-ref info 'conflicts))
    (define assignment (error "Unfinished skeleton"))

    (info-set info 'assignment assignment))

  (match p
    [`(module ,info ,tail)
     `(module ,(update-info info tail) ,tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
