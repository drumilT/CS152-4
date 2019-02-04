#lang racket
(define (listify-function f lst)
  (define (helper f lst)
    (foldr (lambda (x y) (append (list (f (car x) (cadr x))) y)) '() lst))
  (if (null? lst) (list 1 1 1 ) (
   if (= (length lst ) 2) ( helper f (map list (car lst) (cadr lst)))
      (helper f (map list (car lst) (listify-function f (cdr lst))  ))
  ))
  )

(define (list-+ lst )
  ( listify-function + lst))

(define (list-* lst )
  ( listify-function * lst))
