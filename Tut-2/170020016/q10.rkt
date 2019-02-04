#lang racket

(define (kth-element lst k)
  ( if (zero? (- k 1))( car lst)(kth-element (cdr lst) (- k 1))))

(define (slice lst ub lb)
  (define (lower_slice lst lb) (foldr (lambda (x y) (if (not (equal? x (kth-element lst (+ lb 1)) )) (append (list x) y) '())) '() lst))
  (if (zero? (- ub 1)) (lower_slice lst lb)( slice (cdr lst) (- ub 1) (- lb 1)))
  )

