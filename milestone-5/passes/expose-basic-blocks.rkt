#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v5
   "../common.rkt")
(provide expose-basic-blocks)

(define/contract (expose-basic-blocks p)
  (nested-asm-lang-v5? . -> . block-pred-lang-v5?)

  (define (expose-pred pred)
    (error "Unfinished skeleton"))

  (define (expose-tail tail)
    (match tail
      [`(halt ,triv)
       (error "Unfinished skeleton")]
      [`(jump ,trg)
       (error "Unfinished skeleton")]
      [`(begin ,effects ... ,tail)
       (error "Unfinished skeleton")]
      [`(if ,pred ,tail1 ,tail2)
       (error "Unfinished skeleton")]))

  (define (expose-effect effect)
    (match effect
      [`(set! ,_ ,_)
       (error "Unfinished skeleton")]
      [`(begin ,effects ...)
       (error "Unfinished skeleton")]
      [`(if ,pred ,effect1 ,effect2)
       (error "Unfinished skeleton")]))

  (match p
    [`(module ,procs ... ,tail)
     (error "Unfinished skeleton")]))
