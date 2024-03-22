#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "../common.rkt")
(provide interp-loop)

(define/contract (interp-loop code env pc)
  ((listof any/c) dict? natural-number/c . -> . int64?)

  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
