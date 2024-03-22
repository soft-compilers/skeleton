#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v5
  "../common.rkt")
(provide undead-analysis)

(define (loc? x)
  (or (register? x) (fvar? x) (aloc? x)))
(define (triv? x)
  (or (int64? x) (loc? x) (label? x)))

(define (undead-pred pred)
  (match pred
    [`(,(? relop? relop) ,loc ,opand)
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
    [`(halt ,opand)
     (error "Unfinished skeleton")]
    [`(jump ,trg ,locs ...)
     (error "Unfinished skeleton")]
    [`(begin ,effs ... ,tail)
     (error "Unfinished skeleton")]
    [`(if ,pred ,tail1 ,tail2)
     (error "Unfinished skeleton")]))

(define (undead-effect eff)
  (match eff
    [`(set! ,loc (,binop ,loc ,triv))
     (error "Unfinished skeleton")]
    [`(set! ,loc ,(? triv? triv))
     (error "Unfinished skeleton")]
    [`(begin ,effs ...)
     (error "Unfinished skeleton")]
    [`(if ,pred ,eff1 ,eff2)
     (error "Unfinished skeleton")]))

(define/contract (undead-analysis p)
  (asm-pred-lang-v5/locals? . -> . asm-pred-lang-v5/undead?)

  (define (update-info info tail)
    (info-set info 'undead-out (error "Unfinished skeleton")))

  (match p
    [`(module ,info ,procs ... ,tail)
     `(module ,(update-info info tail) ,(error "Unfinished skeleton") ,tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
