#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v3
  "../common.rkt")
(provide sequentialize-let)

; Instead of the values-unique-lang-v3 grammar, we use the following
; overapproximation, where we do not yet distinguish between values in tail
; and non-tail positions. We merge them into the non-terminal term and hence
; use the following grammar for this pass.
;
;   p      ::= (module term)
;   term   ::= triv
;           |  (binop triv triv)
;           |  (let ([aloc term] ...) term)
;   triv   ::= int64
;           |  aloc
;   binop  ::= * | +
;   aloc   ::= aloc?
;   int64  ::= int64?

(define (triv? t)
  (or (name? t) (int64? t)))

(define/contract (sequentialize-let p)
  (values-unique-lang-v3? . -> . imp-mf-lang-v3?)

  (define (sequentialize-term term)
    (match term
      [`(let ([,x-list ,t-list] ...) ,next-term)
       (error "Unfinished skeleton")]
      [`(,binop ,t1 ,t2)
       #:when (binop? binop)
       (error "Unfinished skeleton")]
      [triv
       #:when (triv? triv)
       (error "Unfinished skeleton")]))

  (match p
    [`(module ,term)
     (error "Unfinished skeleton")]))

(module+ test
  (require rackunit rackunit/text-ui))
