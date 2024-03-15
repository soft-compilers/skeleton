#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide sequentialize-let)

; Instead of the values-unique-lang-v4 grammar, we use the following
; overapproximation, where we do not yet distinguish between values in tail
; and non-tail positions, and predicates We merge them into the non-terminal
; term and hence use the following grammar for this pass.
;
;   p      ::= (module term)
;   term   ::= triv
;           |  (true)
;           |  (false)
;           |  (relop triv triv)
;           |  (binop triv triv)
;           |  (not term)
;           |  (if term term term)
;           |  (let ([aloc term] ...) term)
;   triv   ::= int64
;           |  aloc
;   binop  ::= * | +
;   aloc   ::= aloc?
;   int64  ::= int64?

(define (triv? t)
  (or (name? t) (int64? t)))

(define/contract (sequentialize-let p)
  (values-unique-lang-v4? . -> . imp-mf-lang-v4?)

  (define (sequentialize-term term)
    (match term
      [`(let ([,x-list ,t-list] ...) ,next-term)
       (error "Unfinished skeleton")]
      [`(,op ,t1 ,t2)
       #:when (or (binop? op) (relop? op))
       (error "Unfinished skeleton")]
      [(or (? triv?) `(true) `(false))
       (error "Unfinished skeleton")]
      [`(not ,term)
       (error "Unfinished skeleton")]
      [`(if ,term1 ,term2 ,term3)
       (error "Unfinished skeleton")]))

  (match p
    [`(module ,term)
     (error "Unfinished skeleton")]))

(module+ test
  (require rackunit rackunit/text-ui))
