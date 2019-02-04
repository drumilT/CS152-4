#lang racket

(define (flatten lst)
  (if (pair? (car lst))
      (append (flatten (car lst)) (flatten (cdr lst)))
      (append (car lst) (flatten (cdr lst)))
      )
   )
