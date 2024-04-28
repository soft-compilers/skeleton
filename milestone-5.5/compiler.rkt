#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/2c-run-time
 "passes/check-values-lang.rkt"
 "passes/interp-values-lang.rkt"
 "passes/uniquify.rkt"
 "passes/sequentialize-let.rkt"
 "passes/normalize-bind.rkt"
 "passes/propagate-copies.rkt"
 "passes/bury-dead.rkt"
 "passes/impose-calling-conventions.rkt"
 "passes/select-instructions.rkt"
 "passes/uncover-locals.rkt"
 "passes/undead-analysis.rkt"
 "passes/conflict-analysis.rkt"
 "passes/assign-registers.rkt"
 "passes/replace-locations.rkt"
 "passes/assign-homes-opt.rkt"
 "passes/assign-homes.rkt"
 "passes/expose-basic-blocks.rkt"
 "passes/resolve-predicates.rkt"
 "passes/trace-schedule.rkt"
 "passes/flatten-program.rkt"
 "passes/inline-jumps.rkt"
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
 propagate-copies
 bury-dead
 impose-calling-conventions
 select-instructions
 uncover-locals
 undead-analysis
 conflict-analysis
 assign-registers
 replace-locations
 assign-homes-opt
 assign-homes
 expose-basic-blocks
 resolve-predicates
 trace-schedule
 flatten-program
 inline-jumps
 patch-instructions
 implement-fvars

 link-paren-x64
 interp-paren-x64
 generate-x64)

(module+ test
  (require
   rackunit
   rackunit/text-ui
   cpsc411/langs/v5
   cpsc411/test-suite/public/v5
   racket/engine)

  ;; You can modify this pass list, e.g., by adding check-assignment, or other
  ;; debugging and validation passes.
  ;; Doing this may provide additional debugging info when running the rest
  ;; suite.
  (define pass-map-opt
    (list
     (cons check-values-lang interp-values-lang-v5)
     (cons uniquify interp-values-lang-v5)
     (cons sequentialize-let interp-values-unique-lang-v5)
     (cons normalize-bind interp-imp-mf-lang-v5)
     (cons propagate-copies interp-proc-imp-cmf-lang-v5)
     (cons bury-dead interp-proc-imp-cmf-lang-v5)
     (cons impose-calling-conventions interp-proc-imp-cmf-lang-v5)
     (cons select-instructions interp-imp-cmf-lang-v5)

     (cons uncover-locals interp-asm-pred-lang-v5)
     (cons undead-analysis interp-asm-pred-lang-v5/locals)
     (cons conflict-analysis interp-asm-pred-lang-v5/undead)
     (cons assign-registers interp-asm-pred-lang-v5/conflicts)
     (cons replace-locations interp-asm-pred-lang-v5/assignments)

     (cons expose-basic-blocks interp-nested-asm-lang-v5)
     (cons resolve-predicates interp-block-pred-lang-v5)
     (cons trace-schedule interp-block-asm-lang-v5)
     (cons flatten-program interp-block-asm-lang-v5)
     (cons inline-jumps interp-para-asm-lang-v5)
     (cons patch-instructions interp-para-asm-lang-v5)
     (cons implement-fvars interp-paren-x64-fvars-v5)
     (cons generate-x64 interp-paren-x64-v5)
     (cons wrap-x64-run-time #f)
     (cons wrap-x64-boilerplate #f)))

  (current-pass-list
   (map car pass-map-opt))

  (run-tests
   (v5-public-test-suite
    (current-pass-list)
    (map cdr pass-map-opt)
    check-values-lang)))
