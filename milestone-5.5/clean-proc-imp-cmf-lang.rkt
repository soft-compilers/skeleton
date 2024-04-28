#lang racket

(require
  cpsc411/compiler-lib
  cpsc411/langs/v5
  "./common.rkt")
(provide clean-proc-imp-cmf-lang)

(define (opand? x)
  (or (int64? x) (aloc? x)))
(define (triv? x)
  (or (opand? x) (label? x)))

; goes over the abstract syntax and reduces empty begins where it can
(define/contract (clean-proc-imp-cmf-lang p)
  (proc-imp-cmf-lang-v5? . -> . proc-imp-cmf-lang-v5?)

  (define (clean-pred pred live)
    (match pred
      [`(,(? relop? relop) ,loc ,opand)
       pred]
      [(or `(true) `(false))
       pred]
      [`(not ,pred)
       `(not ,(clean-pred pred))]
      [`(begin ,effects ... ,pred)
       (make-begin (map clean-effect effects) (clean-pred pred))]
      [`(if ,pred0 ,pred1 ,pred2)
       `(if ,(clean-pred pred0) ,(clean-pred pred1) ,(clean-pred pred2))]))

  (define (clean-tail tail)
    (match tail
      [`(call ,trivs ...)
       tail]
      [`(begin ,effects ... ,tail)
       (make-begin (map clean-effect effects) (clean-tail tail))]
      [`(if ,pred0 ,tail1 ,tail2)
       `(if ,(clean-pred pred0) ,(clean-tail tail1) ,(clean-tail tail2))]
      [value
       value]))

  (define (clean-effect effect)
    (match effect
      [`(set! ,x ,val)
       effect]
      [`(begin ,effects ...)
       (make-begin-effect (map clean-effect effects))]
      [`(if ,pred0 ,effect1 ,effect2)
       `(if ,(clean-pred pred0) ,(clean-effect effect1) ,(clean-effect effect2))]))

  (define (clean-proc proc)
    (match proc
      [`(define ,label (lambda ,args ,tail))
       `(define ,label (lambda ,args ,(clean-tail tail)))]))

  (match p
    [`(module ,procs ... ,tail)
     `(module ,@(map clean-proc procs) ,(clean-tail tail))]))
