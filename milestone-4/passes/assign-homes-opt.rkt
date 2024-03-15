#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v4
  "uncover-locals.rkt"
  "undead-analysis.rkt"
  "conflict-analysis.rkt"
  "assign-registers.rkt"
  "replace-locations.rkt")
(provide assign-homes-opt)

(define/contract (assign-homes-opt p)
  (asm-pred-lang-v4? . -> . nested-asm-lang-v4?)
  (replace-locations
   (assign-registers
    (conflict-analysis
     (undead-analysis
      (uncover-locals p))))))

(module+ test
  (require
    rackunit
    rackunit/text-ui
    cpsc411/test-suite/public/v2-reg-alloc)
  (run-tests
   (v2-reg-alloc-public-test-suite
    undead-analysis
    conflict-analysis
    assign-registers)))
