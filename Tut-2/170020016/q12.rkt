#lang racket
(define (insert-at a lst pos)
  ( cond [(= pos 1) (append (list a) lst)]
         [ else (cons (car lst) (insert-at a (cdr lst) (- pos 1)))]
         )
  )