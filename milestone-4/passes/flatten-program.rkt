#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide flatten-program)

(define/contract (flatten-program p)
  (block-asm-lang-v4? . -> . para-asm-lang-v4?)

  (define (flatten-tail tail)
    (match tail
      [`(halt ,triv)
       (error "Unfinished skeleton")]
      [`(jump ,trg)
       (error "Unfinished skeleton")]
      [`(begin ,effects ... ,tail)
       (error "Unfinished skeleton")]
      [`(if (,relop ,aloc ,opand) (jump ,label-true) (jump ,label-false))
       (error "Unfinished skeleton")]))

  (define (flatten-block block)
    (match block
      [`(define ,label ,tail)
       (error "Unfinished skeleton")]))

  (match p
    [`(module ,b ...)
     (error "Unfinished skeleton")])

(module+ test
  (require rackunit rackunit/text-ui))
