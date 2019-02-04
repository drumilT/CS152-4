#lang racket
(define (cansurvive pos n)
  (cond[(= 3 pos) #f]
       [(= 2 pos) #t]
       [ else (cansurvive (remainder (+ pos (- n 3)) n) (- n 1))]))