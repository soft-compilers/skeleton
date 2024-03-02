#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v2
  "uncover-locals.rkt"
  "assign-fvars.rkt"
  "replace-locations.rkt")
(provide assign-homes)

(define/contract (assign-homes p)
  (asm-lang-v2? . -> . nested-asm-lang-v2?)
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui))
