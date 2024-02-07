#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v1
  "../common.rkt")
(provide interp-paren-x64)

;; If you choose not to complete, implement a stub that returns a valid exit code
(define/contract (interp-paren-x64 p)
  (paren-x64-v1? . -> . int64?)

  (define (eval-instr-seq regfile seq)
    (match seq
      [`()
       ; If no more instructions, return exit code modulo 256 (since operating
       ; systems return exit code modulo 256).
       (modulo (dict-ref regfile 'rax) 256)]
      [`(,s ,rest ...)
       (error "Unfinished skeleton")]))
  (error "Unfinished skeleton"))

(module+ test
  (require rackunit rackunit/text-ui)

  (check-equal?
   42
   (interp-paren-x64
    '(begin
       (set! rax 0)
       (set! rax (+ rax 42))))))
