#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide undead-analysis)

(define (triv? t) (or (int64? t) (aloc? t)))

(define (undead-pred pred)
  (match pred
    [`(,(? relop? relop) ,aloc ,triv)
     (error "Unfinished skeleton")]
    [(or `(true) `(false))
     (error "Unfinished skeleton")]
    [`(not ,pred)
     (error "Unfinished skeleton")]
    [`(begin ,effs ... ,pred)
     (error "Unfinished skeleton")]
    [`(if ,pred0 ,pred1 ,pred2)
     (error "Unfinished skeleton")]))

(define (undead-tail tail)
  (match tail
    [`(halt ,triv)
     (error "Unfinished skeleton")]
    [`(begin ,effs ... ,tail)
     (error "Unfinished skeleton")]
    [`(if ,pred ,tail1 ,tail2)
     (error "Unfinished skeleton")]))

(define (undead-effect eff)
  (match eff
    [`(set! ,aloc (,binop ,aloc ,triv))
     (error "Unfinished skeleton")]
    [`(set! ,aloc ,(? triv? triv))
     (error "Unfinished skeleton")]
    [`(begin ,effs ...)
     (error "Unfinished skeleton")]
    [`(if ,pred ,eff1 ,eff2)
     (error "Unfinished skeleton")]))

(define/contract (undead-analysis p)
  (asm-pred-lang-v4/locals? . -> . asm-pred-lang-v4/undead?)

  (define (update-info info tail)
    (info-set info 'undead-out (error "Unfinished skeleton")))

  (match p
    [`(module ,info ,tail)
     `(module ,(update-info info tail) ,tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
