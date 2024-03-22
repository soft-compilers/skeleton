#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v5
  "../common.rkt")
(provide replace-locations)

; This pass only operates on abstract locations contained in trivs and leaves
; the shape of preds, tails, and effects unchanged. We therefore combined these
; three non-terminals into a single non-terminal term to reduce some boilerplate.
; Hence, the grammar that we are considering for this pass is the following:
;
;   p      ::=  (module info term)
;   info   ::=  (#:from-contract
;                  (info/c (locals (aloc ...))
;                  (assignment ((aloc loc) ...))))
;   term   ::=  (begin term ...)
;           |   (set! aloc triv)
;           |   (set! aloc_1 (binop aloc_1 triv))
;           |   (halt triv)
;           |   (relop triv triv)
;           |   (true)
;           |   (false)
;           |   (not term)
;           |   (if term term term)

(define (triv? x)
  (or (int64? x) (aloc? x)))

(define/contract (replace-locations p)
  (asm-pred-lang-v5/assignments? . -> . nested-asm-lang-v5?)

  (define (replace-term term)
    (match term
      [`(begin ,terms ...)
       (error "Unfinished skeleton")]
      [`(set! ,aloc ,(? triv? triv))
       (error "Unfinished skeleton")]
      [`(set! ,aloc1 (,binop ,aloc1 ,triv))
       (error "Unfinished skeleton")]
      [`(halt ,triv)
       (error "Unfinished skeleton")]
      [`(jump ,trg ,_ ...)
       (error "Unfinished skeleton")]
      [`(,(? relop? relop) ,triv1 ,triv2)
       (error "Unfinished skeleton")]
      [(or `(true) `(false))
       (error "Unfinished skeleton")]
      [`(not ,term)
       (error "Unfinished skeleton")]
      [`(if ,term1 ,term2 ,term3)
       (error "Unfinished skeleton")]))

  (match p
    [`(module ,info ,procs ... ,term)
     (error "Unfinished skeleton")]))

(module+ test
  (require rackunit rackunit/text-ui))
