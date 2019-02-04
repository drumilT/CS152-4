#lang racket
(define (square x2) (* x2 x2))
(define (my_expt x1 lst)
  (foldl (lambda (x y) (if (zero? x) (square y) (* (square y) x1))) 1 lst))