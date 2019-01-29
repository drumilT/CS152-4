#lang racket

(define (remove-consecutive lst)
  (foldr (lambda (x y)(if (null? (car y))
                          (list x)
                       (if (not (equal? x (car y)))
                          (append (list x) y) y))) '(()) lst)
  )

