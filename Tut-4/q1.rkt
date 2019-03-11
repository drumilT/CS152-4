#lang racket


(define (sum3 )
  (define (helper a b c)
    (if ( and (displayln ( + a b c)) (helper b c (read))) #t #f)
  )
  (helper 0 0 (read)))