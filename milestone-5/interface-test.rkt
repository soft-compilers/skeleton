#lang racket/base

(module+ test
  (require
   cpsc411/test-suite/utils)

  ; Compilation passes
  (check-import-list "passes/uniquify.rkt"                   '(uniquify))
  (check-import-list "passes/sequentialize-let.rkt"          '(sequentialize-let))
  (check-import-list "passes/normalize-bind.rkt"             '(normalize-bind))
  (check-import-list "passes/impose-calling-conventions.rkt" '(impose-calling-conventions))
  (check-import-list "passes/select-instructions.rkt"        '(select-instructions))
  (check-import-list "passes/uncover-locals.rkt"             '(uncover-locals))
  (check-import-list "passes/undead-analysis.rkt"            '(undead-analysis))
  (check-import-list "passes/conflict-analysis.rkt"          '(conflict-analysis))
  (check-import-list "passes/assign-registers.rkt"           '(assign-registers))
  (check-import-list "passes/replace-locations.rkt"          '(replace-locations))
  (check-import-list "passes/assign-homes-opt.rkt"           '(assign-homes-opt))
  (check-import-list "passes/expose-basic-blocks.rkt"        '(expose-basic-blocks))
  (check-import-list "passes/resolve-predicates.rkt"         '(resolve-predicates))
  (check-import-list "passes/flatten-program.rkt"            '(flatten-program))
  (check-import-list "passes/patch-instructions.rkt"         '(patch-instructions))
  (check-import-list "passes/implement-fvars.rkt"            '(implement-fvars))
  (check-import-list "passes/generate-x64.rkt"               '(generate-x64))

  ; Validators and interpreters
  (check-import-list "passes/check-values-lang.rkt"  '(check-values-lang))
  (check-import-list "passes/interp-values-lang.rkt" '(interp-values-lang))
  (check-import-list "passes/check-paren-x64.rkt"    '(check-paren-x64))
  (check-import-list "passes/link-paren-x64.rkt"     '(link-paren-x64))
  (check-import-list "passes/interp-paren-x64.rkt"   '(interp-paren-x64)))
