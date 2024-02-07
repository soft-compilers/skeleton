#lang racket

(require
 cpsc411/compiler-lib
 "passes/check-paren-x64.rkt"
 "passes/interp-paren-x64.rkt"
 "passes/generate-x64.rkt"
 "passes/wrap-x64.rkt")

(provide
 check-paren-x64
 interp-paren-x64
 generate-x64
 wrap-x64-run-time
 wrap-x64-boilerplate)

(current-pass-list
 (list
  check-paren-x64
  generate-x64
  wrap-x64-run-time
  wrap-x64-boilerplate))

(module+ test
  (require
    rackunit
    rackunit/text-ui
    cpsc411/langs/v1
    cpsc411/test-suite/public/v1)

  (run-tests
   (v1-public-test-suite
    (list
     check-paren-x64
     generate-x64
     wrap-x64-run-time
     wrap-x64-boilerplate)
    (list
     interp-paren-x64-v1
     interp-paren-x64-v1
     #f
     #f)
    check-paren-x64
    interp-paren-x64)))
