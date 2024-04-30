#lang racket

(require
 cpsc411/compiler-lib
 cpsc411/langs/v6
 "../common.rkt")
(provide allocate-frames)

(define (update-info-tail info tail)

  (define call-undead (info-ref info 'call-undead))
  (define locals (info-ref info 'locals))
  (define assignment (info-ref info 'assignment))
  (define new-frames (info-ref info 'new-frames))

  (define new-assignment (error "Unfinished skeleton"))
  (define new-locals (error "Unfinished skeleton"))

  (define new-info
    ((compose1
      (curryr info-set 'assignment new-assignment)
      (curryr info-set 'locals new-locals)
      (curryr info-remove 'call-undead)
      (curryr info-remove 'new-frames)
      (curryr info-remove 'undead-out))
     info))

  (define (allocate-pred pred)
    (match pred
      [(or `(,(? relop?) ,_ ,_) `(true) `(false))
       pred]
      [`(not ,pred)
       `(not ,(allocate-pred pred))]
      [`(begin ,effects ... ,pred)
       (make-begin (map allocate-effect effects) (allocate-pred pred))]
      [`(if ,pred0 ,pred1 ,pred2)
       `(if ,(allocate-pred pred0) ,(allocate-pred pred1) ,(allocate-pred pred2))]))

  (define (allocate-tail tail)
    (match tail
      [`(jump ,trg ,locs ...)
       tail]
      [`(begin ,effects ... ,tail)
       (make-begin (map allocate-effect effects) (allocate-tail tail))]
      [`(if ,pred ,tail1 ,tail2)
       `(if ,(allocate-pred pred) ,(allocate-tail tail1) ,(allocate-tail tail2))]))

  (define (allocate-effect effect)
    (match effect
      [`(set! ,_ ,_)
       effect]
      [`(begin ,effects ...)
       (make-begin-effect (map allocate-effect effects))]
      [`(if ,pred ,effect1 ,effect2)
       `(if ,(allocate-pred pred) ,(allocate-effect effect1) ,(allocate-effect effect2))]
      [`(return-point ,rp ,tail)
       (error "Unfinished skeleton")]))

  (values
   new-info
   (allocate-tail tail)))

(define/contract (allocate-frames p)
  (asm-pred-lang-v6/pre-framed? . -> . asm-pred-lang-v6/framed?)

  (define (allocate-proc proc)
    (match proc
      [`(define ,label ,info ,tail)
       (define-values (new-info new-tail) (update-info-tail info tail))
       `(define ,label ,new-info ,new-tail)]))

  (match p
    [`(module ,info ,procs ... ,tail)
     (define-values (new-info new-tail) (update-info-tail info tail))
     `(module ,new-info ,@(map allocate-proc procs) ,new-tail)]))

(module+ test
  (require rackunit rackunit/text-ui))
