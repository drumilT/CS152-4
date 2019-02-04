#lang racket
( define (rle lst)
   (define (helper lst1 lst2)
     (if (null? lst1) lst2 (
      if (equal? (car lst1) (caar lst2))
         (helper (cdr lst1) (cons (append (list( caar lst2))  (list ( + (cadar lst2) 1))) (cdr lst2)))
         (helper (cdr lst1) (cons (append (list ( car lst1)) (list 1)) lst2))
         )
         )
     )
   (helper (cdr (reverse lst)) (list(append (list (car (reverse lst))) (list 1) ))
           )
   )
   