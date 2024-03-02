#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v3
  "../common.rkt")
(provide uniquify)

; This pass only operates on identifiers and otherwise leaves the shape of
; tails and values unchanged. We therefore combined these two non-terminals
; into a single non-terminal term to reduce some boilerplate. Hence, the
; grammar that we are considering for this pass is the following:
;
;   p     ::= (module term)
;   term  ::= triv
;          |  (binop triv triv)
;          |  (let ([x term] ...) term)
;   triv  ::= int64
;          |  x
;   x     ::= name?
;   binop ::= * | +
;   int64 ::= int64?

(define (triv? t)
  (or (name? t) (int64? t)))

(define/contract (uniquify p)
  (values-lang-v3? . -> . values-unique-lang-v3?)

  (define (uniquify-term term)
    (match term
      [`(,binop ,t1 ,t2)
       (error "Unfinished skeleton")]
      [`(let ([,x-list ,t-list] ...) ,next-term)
       (error "Unfinished skeleton")]
      [triv
       #:when (triv? triv)
       (error "Unfinished skeleton")]))

  (match p
    [`(module ,term)
     (error "Unfinished skeleton")]))

(module+ test
  (require rackunit rackunit/text-ui))
