#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/graph-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide conflict-analysis)

(define (triv? x)
  (or (int64? x) (register? x) (fvar? x) (aloc? x) (label? x)))

(define/contract (conflict-analysis p)
  (asm-pred-lang-v6/undead? . -> . asm-pred-lang-v6/conflicts?)

  (define (conflict-pred pred undead)
    (match* (pred undead)
      [(`(,(? relop? relop) ,loc ,triv) _)
       (error "Unfinished skeleton")]
      [((or `(true) `(false)) _)
       (error "Unfinished skeleton")]
      [(`(not ,pred) _)
       (error "Unfinished skeleton")]
      [(`(begin ,effs ... ,pred) `(,undead-effs ... ,undead-pred))
       (error "Unfinished skeleton")]
      [(`(if ,pred1 ,pred2 ,pred3) `(,undead1 ,undead2 ,undead3))
       (error "Unfinished skeleton")]))

  (define (conflict-tail tail undead)
    (match* (tail undead)
      [(`(jump ,trg ,locs ...) _)
       (error "Unfinished skeleton")]
      [(`(begin ,effs ... ,tail) `(,undead-effs ... ,undead-tail))
       (error "Unfinished skeleton")]
      [(`(if ,pred ,tail1 ,tail2) `(,undead-pred ,undead-tail1 ,undead-tail2))
       (error "Unfinished skeleton")]))

  (define (conflict-effect eff undead)
    (error "Unfinished skeleton"))

  (define (update-info info tail)
    (define locals (info-ref info 'locals))
    (define undead-out (info-ref info 'undead-out))
    (define conflicts (error "Unfinished skeleton"))
    (info-set (info-remove info 'undead-out) 'conflicts conflicts))

  (match p
    [`(module ,info ,procs ... ,tail)
     `(module ,(update-info info tail) ,(error "Unfinished skeleton") ,tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
