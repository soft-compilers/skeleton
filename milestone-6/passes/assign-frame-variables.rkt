#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v6
 "../common.rkt")
(provide assign-frame-variables)

(define (update-info info)
  (define locals (info-ref info 'locals))
  (define conflicts (info-ref info 'conflicts))
  (define assignment (info-ref info 'assignment))

  (define new-assignment (error "Unfinished skeleton"))

  ((compose1
    (curryr info-set 'assignment new-assignment)
    (curryr info-remove 'conflicts)
    (curryr info-remove 'locals))
   info))

(define/contract (assign-frame-variables p)
  (asm-pred-lang-v6/spilled? . -> . asm-pred-lang-v6/assignments?)

  (define (assign-proc proc)
    (match proc
      [`(define ,label ,info ,tail)
       `(define ,label ,(update-info info) ,tail)]))

  (match p
    [`(module ,info ,procs ... ,tail)
     `(module ,(update-info info) ,@(map assign-proc procs) ,tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
