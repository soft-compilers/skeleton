#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/graph-lib
  cpsc411/langs/v2
  cpsc411/langs/v2-reg-alloc)
(provide undead-analysis)

(define (triv? t) (or (int64? t) (aloc? t)))

(define (undead-tail tail)
  (match tail
    [`(halt ,triv)
     (error "Unfinished skeleton")]
    [`(begin ,effs ... ,tail)
     (error "Unfinished skeleton")]))

(define (undead-effect eff liveout)
  (match eff
    [`(set! ,aloc (,binop ,aloc ,triv))
     (error "Unfinished skeleton")]
    [`(set! ,aloc ,(? triv? triv))
     (error "Unfinished skeleton")]
    [`(begin ,effs ...)
     (error "Unfinished skeleton")]))

(define/contract (undead-analysis p)
  (asm-lang-v2/locals? . -> . asm-lang-v2/undead?)

  (define (update-info info tail)
    (info-set info 'undead-out (error "Unfinished skeleton")))

  (match p
    [`(module ,info ,tail)
     `(module ,(update-info info tail) ,tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
