#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide uniquify)

; This pass only operates on identifiers and otherwise leaves the shape of
; preds, tails and values unchanged. We therefore combined these three
; non-terminals into a single non-terminal term to reduce some boilerplate.
; Hence, the grammar that we are considering for this pass is the following:
;
;   p     ::= (module term)
;   term  ::= triv
;          |  (true)
;          |  (false)
;          |  (relop triv triv)
;          |  (binop triv triv)
;          |  (not term)
;          |  (if term term term)
;          |  (let ([x term] ...) term)
;          |  (call triv ...)
;   triv  ::= int64
;          |  x
;   x     ::= name?
;   binop ::= * | +
;   int64 ::= int64?

(define (triv? t)
  (or (name? t) (int64? t)))

(define/contract (uniquify p)
  (values-lang-v6? . -> . values-unique-lang-v6?)

  (define (uniquify-term term)
    (match term
      [`(,op ,t1 ,t2)
       #:when (or (binop? op) (relop? op))
       (error "Unfinished skeleton")]
      [`(let ([,x-list ,t-list] ...) ,next-term)
       (error "Unfinished skeleton")]
      [(? triv? triv)
       (error "Unfinished skeleton")]
      [(or `(true) `(false))
       (error "Unfinished skeleton")]
      [`(not ,term)
       (error "Unfinished skeleton")]
      [`(if ,term1 ,term2 ,term3)
       (error "Unfinished skeleton")]
      [`(call ,trivs ...)
       (error "Unfinished skeleton")]))

  (match p
    [`(module (define ,proc-names ,proc-lambdas) ... ,term)
     (error "Unfinished skeleton")]))

(module+ test
  (require rackunit rackunit/text-ui))
