#lang racket

(require
 cpsc411/compiler-lib)
(provide (all-defined-out))

(define binops
  (list->set '(* + -)))
(define (binop? x)
  (set-member? binops x))
(define relops
  (list->set '(< <= > >= = !=)))
(define (relop? x)
  (set-member? relops x))

; Small helper function to add a label to the first instruction
; of a non-empty list of instructions.
(define (make-with label instrs)
  (match instrs
    [(cons i is)
     (cons `(with-label ,label ,i) is)]))
