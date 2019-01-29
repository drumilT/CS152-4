#lang racket

(define (pack lst)
  (foldr (lambda (x y) (if (null? y)
                           (list (list x))
                           (if (equal? x (car (car y)))
                               (cons (cons x (car y))(cdr y))
                               (cons (list x) y)
                               )
                           
           )) '() lst)
  )
