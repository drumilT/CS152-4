#lang racket
( define ( pascal n )
   (if ( equal? n 0) (list '(1))
       (if( equal? n 1) (list '(1 1) )
       (append (pascal (- n 1)) ( list ( create ( car ( reverse (pascal (- n 1)))))))
       )
       ))

( define ( create lst)
   ( foldr (lambda ( x y) (append (list x) (list (+ x (car y))) (cdr y))) '(0) lst))