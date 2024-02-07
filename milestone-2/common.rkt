#lang racket

(require
 cpsc411/compiler-lib)
(provide (all-defined-out))

(define binops
  (list->set '(* +)))
(define (binop? x)
  (set-member? binops x))
