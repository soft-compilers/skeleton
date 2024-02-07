#lang racket/base

(module+ test
  (require
   cpsc411/test-suite/utils)

  ; Compilation passes
  (check-import-list "passes/generate-x64.rkt" '(generate-x64))
  (check-import-list "passes/wrap-x64.rkt" '(wrap-x64-run-time wrap-x64-boilerplate))

  ; Validators and interpreters
  (check-import-list "passes/check-paren-x64.rkt" '(check-paren-x64))
  (check-import-list "passes/interp-paren-x64.rkt" '(interp-paren-x64)))
