#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v2
  "../common.rkt")
(provide replace-locations)

; This pass only operates on abstract locations contained in trivs and leaves
; the shape of tail, and effect unchanged. We therefore combined these two
; non-terminal into a single non-terminal term to reduce some boilerplate.
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
;   triv   ::=  int64 | aloc
;   loc    ::=  reg | fvar
;   binop  ::=  * | +

(define (triv? x)
  (or (int64? x) (aloc? x)))

(define/contract (replace-locations p)
  (asm-lang-v2/assignments? . -> . nested-asm-lang-v2?)

  (define (replace-term term)
    (match term
      [`(begin ,terms ...)
       (error "Unfinished skeleton")]
      [`(set! ,aloc ,(? triv? triv))
       (error "Unfinished skeleton")]
      [`(set! ,aloc1 (,binop ,aloc2 ,triv))
       (error "Unfinished skeleton")]
      [`(halt ,triv)
       (error "Unfinished skeleton")]))

  (match p
    [`(module ,info ,term)
     (error "Unfinished skeleton")]))

(module+ test
  (require rackunit rackunit/text-ui))
