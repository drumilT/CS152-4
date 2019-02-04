#lang racket

(define (kth-element lst k)
  ( if (zero? (- k 1))( car lst)(kth-element (cdr lst) (- k 1))))

(define (rotate lst num)
  (define (upper_slice lst lb)
    (foldr (lambda (x y) (if (not (equal? x (kth-element lst (+ lb 1) ) )) (append (list x) y) '())) '() lst))
  (define (lower_slice lst lb)
    (foldl (lambda (x y) (if (not (equal? x (kth-element lst (+ lb 1)) )) (append y (list x) ) '())) '() lst))
  (if (> num 0) (append (lower_slice lst num) (upper_slice lst num))(append (lower_slice lst (- (+ (length lst) num) 1))

