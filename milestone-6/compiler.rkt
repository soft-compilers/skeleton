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
 "passes/assign-call-undead-variables.rkt"
 "passes/allocate-frames.rkt"
 "passes/assign-registers.rkt"
 "passes/assign-frame-variables.rkt"
 "passes/replace-locations.rkt"
 "passes/implement-fvars.rkt"
 "passes/expose-basic-blocks.rkt"
 "passes/resolve-predicates.rkt"
 "passes/trace-schedule.rkt"
 "passes/flatten-program.rkt"
 "passes/inline-jumps.rkt"
 "passes/patch-instructions.rkt"
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
 assign-call-undead-variables
 allocate-frames
 assign-registers
 assign-frame-variables
 replace-locations
 implement-fvars
 expose-basic-blocks
 resolve-predicates
 trace-schedule
 flatten-program
 inline-jumps
 patch-instructions

 link-paren-x64
 interp-paren-x64
 generate-x64)

(module+ test
  (require
   rackunit
   rackunit/text-ui
   cpsc411/langs/v6
   cpsc411/test-suite/private/v6
   cpsc411/test-suite/public/v6
   racket/engine)

  ;; You can modify this pass list, e.g., by adding check-assignment, or other
  ;; debugging and validation passes.
  ;; Doing this may provide additional debugging info when running the rest
  ;; suite.
  (define pass-map-opt
    (list
     (cons check-values-lang interp-values-lang-v6)
     (cons uniquify interp-values-lang-v6)
     (cons sequentialize-let interp-values-unique-lang-v6)
     (cons normalize-bind interp-imp-mf-lang-v6)
     (cons propagate-copies interp-proc-imp-cmf-lang-v6)
     (cons bury-dead interp-proc-imp-cmf-lang-v6)
     (cons impose-calling-conventions interp-proc-imp-cmf-lang-v6)
     (cons select-instructions interp-imp-cmf-lang-v6)

     (cons uncover-locals interp-asm-pred-lang-v6)
     (cons undead-analysis interp-asm-pred-lang-v6/locals)
     (cons conflict-analysis interp-asm-pred-lang-v6/undead)
     (cons assign-call-undead-variables interp-asm-pred-lang-v6/conflicts)
     (cons allocate-frames interp-asm-pred-lang-v6/pre-framed)
     (cons assign-registers interp-asm-pred-lang-v6/framed)
     (cons assign-frame-variables interp-asm-pred-lang-v6/spilled)
     (cons replace-locations interp-asm-pred-lang-v6/assignments)

     (cons implement-fvars interp-nested-asm-lang-fvars-v6)
     (cons expose-basic-blocks interp-nested-asm-lang-v6)
     (cons resolve-predicates interp-block-pred-lang-v6)
     (cons trace-schedule interp-block-asm-lang-v6)
     (cons flatten-program interp-block-asm-lang-v6)
     (cons inline-jumps interp-para-asm-lang-v6)
     (cons patch-instructions interp-para-asm-lang-v6)
     (cons generate-x64 interp-paren-x64-v6)
     (cons wrap-x64-run-time #f)
     (cons wrap-x64-boilerplate #f)))

  (current-pass-list
   (map car pass-map-opt))

  (run-tests
   (v6-public-test-suite
    (current-pass-list)
    (map cdr pass-map-opt))))
