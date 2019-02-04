#lang racket

(define (find-out k lst) (foldr (lambda (x y) (if y y (if (equal? k x) #t #f))) #f lst))

(define (remove-duplicates lst)
  
  (foldl (lambda (x y)(if (null? (car y))
                          (list x)
                       (if (find-out x y)
                          y (append y (list x) ) ))) '(()) lst)
  )

