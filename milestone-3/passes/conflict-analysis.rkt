#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/graph-lib
  cpsc411/langs/v2
  cpsc411/langs/v2-reg-alloc)
(provide conflict-analysis)

(define (triv? t) (or (int64? t) (aloc? t)))

(define/contract (conflict-analysis p)
  (asm-lang-v2/undead? . -> . asm-lang-v2/conflicts?)

  (define (conflict-tail tail undead)
    (match* (tail undead)
      [(`(halt ,opand) _)
       (error "Unfinished skeleton")]
      [(`(jump ,trg ,liveout ...) _)
       (error "Unfinished skeleton")]
      [(`(begin ,effs ... ,tail) `(,undead-effs ... ,undead-tail))
       (error "Unfinished skeleton")]))

  (define (conflict-effect eff undead)
    (error "Unfinished skeleton"))

  (define (update-info info tail)
    (define locals (info-ref info 'locals))
    (define undead-out (info-ref info 'undead-out))
    (define conflicts (error "Unfinished skeleton"))
    (info-set (info-remove info 'undead-out) 'conflicts conflicts))

  (match p
    [`(module ,info ,tail)
     `(module ,(update-info info tail) ,tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
