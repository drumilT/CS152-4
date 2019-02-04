#lang racket
(define (summands num)
  (define (helper num1 num2 lst)
    (if (= num1 num2) (append lst ( list (list num1)))
        ( helper num1 (+ num2 1) (append lst ( map (lambda (lst) (append (list num2) lst)) (summands (- num1 num2)))) )
        ))
  ( if (= num 1) ( list ( list 1) ) ( cdr (helper num 1 '(()) )) )
  )