#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v6
  "../common.rkt")
(provide resolve-predicates)

(define/contract (resolve-predicates bp)
  (block-pred-lang-v6? . -> . block-asm-lang-v6?)

  (define (resolve-pred pred)
    (match pred
      [`(,(? relop? relop) ,loc ,opand)
       (error "Unfinished skeleton")]
      [`(true)
       (error "Unfinished skeleton")]
      [`(false)
       (error "Unfinished skeleton")]
      [`(not ,pred)
       (error "Unfinished skeleton")]))

  (define (resolve-tail tail)
    (match tail
      [`(halt ,opand)
       (error "Unfinished skeleton")]
      [`(jump ,trg)
       (error "Unfinished skeleton")]
      [`(begin ,effects ... ,tail)
       (error "Unfinished skeleton")]
      [`(if ,pred ,trg-true ,trg-false)
       (error "Unfinished skeleton")]))

  (define (resolve-block block)
    (match block
      [`(define ,label ,tail)
       (error "Unfinished skeleton")]))

  (match bp
    [`(module ,blocks ...)
     (error "Unfinished skeleton")]))

(module+ test
  (require rackunit rackunit/text-ui))
