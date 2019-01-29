#lang racket

(define (kth-element lst k)
  ( if (zero? (- k 1))( car lst)(kth-element (cdr lst) (- k 1))))

(define (drop lst num)
  (foldr (lambda (x y) (if (equal? x (kth-element lst num) ) y ( append (list x) y))) '() lst)
  )

