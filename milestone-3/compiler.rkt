#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/2c-run-time
 "passes/check-values-lang.rkt"
 "passes/interp-values-lang.rkt"
 "passes/uniquify.rkt"
 "passes/sequentialize-let.rkt"
 "passes/normalize-bind.rkt"
 "passes/select-instructions.rkt"
 "passes/undead-analysis.rkt"
 "passes/conflict-analysis.rkt"
 "passes/assign-registers.rkt"
 "passes/replace-locations.rkt"
 "passes/assign-homes-opt.rkt"
 "passes/assign-homes.rkt"
 "passes/flatten-begins.rkt"
 "passes/patch-instructions.rkt"
 "passes/implement-fvars.rkt"
 "passes/generate-x64.rkt"
 "passes/check-paren-x64.rkt"
 "passes/interp-paren-x64.rkt")

(provide
 check-values-lang
 interp-values-lang
 uniquify
 sequentialize-let
 normalize-bind
 select-instructions
 undead-analysis
 conflict-analysis
 assign-registers
 replace-locations
 assign-homes-opt
 assign-homes
 flatten-begins
 patch-instructions
 implement-fvars
 check-paren-x64
 interp-paren-x64
 generate-x64)

(current-pass-list
 (list
  check-values-lang
  uniquify
  sequentialize-let
  normalize-bind
  select-instructions
  assign-homes-opt
  flatten-begins
  patch-instructions
  implement-fvars
  generate-x64
  wrap-x64-run-time
  wrap-x64-boilerplate))

(module+ test
  (require
   rackunit
   rackunit/text-ui
   cpsc411/langs/v3
   cpsc411/langs/v2
   cpsc411/test-suite/public/v3)

  (run-tests
   (v3-public-test-sutie
    (current-pass-list)
    (list
     interp-values-lang-v3
     interp-values-lang-v3
     interp-values-unique-lang-v3
     interp-imp-mf-lang-v3
     interp-imp-cmf-lang-v3
     interp-asm-lang-v2
     interp-nested-asm-lang-v2
     interp-para-asm-lang-v2
     interp-paren-x64-fvars-v2
     interp-paren-x64-v2
     #f #f))))
