#lang racket

(define (gc num1)  
  ( if (= num1 0) '(()) (append  ( map (lambda (lst) (append (list 0) lst))
                        (gc (- num1 1)))
                        ( map (lambda (lst) (append (list 1) lst))
                        (reverse (gc (- num1 1))))      
                                )
       )
  )