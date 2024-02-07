#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v1
 "../common.rkt")
(provide generate-x64)

(define/contract (generate-x64 p)
  (paren-x64-v1? . -> . string?)

  ; Paren-x64-v1 -> x64-instruction-sequence
  (define (generate-p p)
    (match p
      [`(begin ,s ...)
       (error "Unfinished skeleton")]))

  (define (generate-s s)
    (error "Unfinished skeleton"))

  (define (generate-b b)
    (error "Unfinished skeleton"))

  (generate-p p))

(module+ test
  (require rackunit rackunit/text-ui))
