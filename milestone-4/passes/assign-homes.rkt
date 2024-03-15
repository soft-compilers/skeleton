#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "uncover-locals.rkt"
  "assign-fvars.rkt"
  "replace-locations.rkt")
(provide assign-homes)

(define/contract (assign-homes p)
  (asm-pred-lang-v4? . -> . nested-asm-lang-v4?)
  (replace-locations (assign-fvars (uncover-locals p))))

(module+ test
  (require rackunit rackunit/text-ui))
