#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/graph-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide assign-call-undead-variables)

(define (update-info info)
  (define call-undead (info-ref info 'call-undead))
  (define conflicts (info-ref info 'conflicts))

  (define assignment (error "Unfinished skeleton"))
  (define locals (error "Unfinished skeleton"))

  ((compose1
    (curryr info-set 'assignment assignment)
    (curryr info-set 'locals locals))
   info))

(define/contract (assign-call-undead-variables p)
  (asm-pred-lang-v6/conflicts? . -> . asm-pred-lang-v6/pre-framed?)

  (define (assign-proc proc)
    (match proc
      [`(define ,label ,info ,tail)
       `(define ,label ,(update-info info) ,tail)]))

  (match p
    [`(module ,info ,procs ... ,tail)
     `(module ,(update-info info) ,@(map assign-proc procs) ,tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
