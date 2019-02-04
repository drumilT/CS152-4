#lang racket
(define (shuffle lst1 lst2)
 (cond [(and ( = (length lst1) 1) ( = (length lst2) 1)) (list( (append lst2 lst1) (append lst1 lst2))) ]
       [(and ( = (length lst1) 1) ( > (length lst2) 1)) (list( (append lst2 lst1) (append lst1 lst2))) ]
       [(and ( = (length lst1) 1) ( = (length lst2) 1)) (list( (append lst2 lst1) (append lst1 lst2))) ]
       [(and ( = (length lst1) 1) ( = (length lst2) 1)) (list( (append lst2 lst1) (append lst1 lst2))) ])