#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/graph-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide assign-registers)

(define (update-info info)
  (define locals (info-ref info 'locals))
  (define conflicts (info-ref info 'conflicts))
  (define assignment (info-ref info 'assignment))

  (define new-assignment (error "Unfinished skeleton"))

  (info-set info 'assignment new-assignment))

(define/contract (assign-registers p)
  (asm-pred-lang-v6/framed? . -> . asm-pred-lang-v6/spilled?)

  (define (assign-proc proc)
    (match proc
      [`(define ,label ,info ,tail)
       `(define ,label ,(update-info info) ,tail)]))

  (match p
    [`(module ,info ,procs ... ,tail)
     `(module ,(update-info info tail) ,@(map assign-proc procs) ,tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
