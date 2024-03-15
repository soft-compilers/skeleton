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
 "passes/uncover-locals.rkt"
 "passes/undead-analysis.rkt"
 "passes/conflict-analysis.rkt"
 "passes/assign-fvars.rkt"
 "passes/assign-registers.rkt"
 "passes/replace-locations.rkt"
 "passes/assign-homes-opt.rkt"
 "passes/assign-homes.rkt"
 "passes/expose-basic-blocks.rkt"
 "passes/resolve-predicates.rkt"
 "passes/flatten-program.rkt"
 "passes/patch-instructions.rkt"
 "passes/implement-fvars.rkt"
 "passes/generate-x64.rkt"
 "passes/link-paren-x64.rkt"
 "passes/interp-paren-x64.rkt")

(provide
 check-values-lang
 interp-values-lang

 uniquify
 sequentialize-let
 normalize-bind
 select-instructions
 uncover-locals
 undead-analysis
 conflict-analysis
 assign-fvars
 assign-registers
 replace-locations
 assign-homes-opt
 assign-homes
 expose-basic-blocks
 resolve-predicates
 flatten-program
 patch-instructions
 implement-fvars

 link-paren-x64
 interp-paren-x64
 generate-x64)

(module+ test
  (require
   rackunit
   rackunit/text-ui
   cpsc411/langs/v4
   cpsc411/test-suite/private/v4
   cpsc411/test-suite/public/v4
   racket/engine)

  ;; You can modify this pass list, e.g., by adding check-assignment, or other
  ;; debugging and validation passes.
  ;; Doing this may provide additional debugging info when running the rest
  ;; suite.
  (define pass-map-opt
    (list
     (cons check-values-lang interp-values-lang-v4)
     (cons uniquify interp-values-lang-v4)
     (cons sequentialize-let interp-values-unique-lang-v4)
     (cons normalize-bind interp-imp-mf-lang-v4)
     (cons select-instructions interp-imp-cmf-lang-v4)

     (cons uncover-locals interp-asm-pred-lang-v4)
     (cons undead-analysis interp-asm-pred-lang-v4/locals)
     (cons conflict-analysis interp-asm-pred-lang-v4/undead)
     (cons assign-registers interp-asm-pred-lang-v4/conflicts)
     (cons replace-locations interp-asm-pred-lang-v4/assignments)

     (cons expose-basic-blocks interp-nested-asm-lang-v4)
     (cons resolve-predicates interp-block-pred-lang-v4)
     (cons flatten-program interp-block-asm-lang-v4)
     (cons patch-instructions interp-para-asm-lang-v4)
     (cons implement-fvars interp-paren-x64-fvars-v4)
     (cons generate-x64 interp-paren-x64-v4)
     (cons wrap-x64-run-time #f)
     (cons wrap-x64-boilerplate #f)))

  (current-pass-list
   (map car pass-map-opt))

  (run-tests
  (v4-private-test-suite
   (current-pass-list)
   (map cdr pass-map-opt)
   link-paren-x64
   interp-paren-x64
   interp-values-lang
   check-values-lang))

  (run-tests
   (v4-public-test-suite
    (current-pass-list)
    (map cdr pass-map-opt)
    link-paren-x64
    interp-paren-x64
    interp-values-lang
    check-values-lang))

  (define pass-map-unopt
    (list
     (cons check-values-lang interp-values-lang-v4)
     (cons uniquify interp-values-lang-v4)
     (cons sequentialize-let interp-values-unique-lang-v4)
     (cons normalize-bind interp-imp-mf-lang-v4)
     (cons select-instructions interp-imp-cmf-lang-v4)

     (cons uncover-locals interp-asm-pred-lang-v4)
     (cons assign-fvars interp-asm-pred-lang-v4/locals)
     (cons replace-locations interp-asm-pred-lang-v4/assignments)

     (cons expose-basic-blocks interp-nested-asm-lang-v4)
     (cons resolve-predicates interp-block-pred-lang-v4)
     (cons flatten-program interp-block-asm-lang-v4)
     (cons patch-instructions interp-para-asm-lang-v4)
     (cons implement-fvars interp-paren-x64-fvars-v4)
     (cons generate-x64 interp-paren-x64-v4)
     (cons wrap-x64-run-time #f)
     (cons wrap-x64-boilerplate #f)))

  (current-pass-list
   (map car pass-map-unopt))

  (run-tests
  (v4-private-test-suite
   (current-pass-list)
   (map cdr pass-map-unopt)
   link-paren-x64
   interp-paren-x64
   interp-values-lang
   check-values-lang))

  (run-tests
   (v4-public-test-suite
    (current-pass-list)
    (map cdr pass-map-unopt)
    link-paren-x64
    interp-paren-x64
    interp-values-lang
    check-values-lang)))
