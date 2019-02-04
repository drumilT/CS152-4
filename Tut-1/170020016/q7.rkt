#lang racket
(define (simplify r)
  (cons (/ (car r) (gcd(car r) (cdr r)) )(/ (cdr r) (gcd(car r) (cdr r)) )))

(define (add r1 r2)
  (simplify (cons
             ( + (* (car r1) (cdr r2))(* (cdr r1) (car r2)))
                 (* (cdr r1) (cdr r2))
                 
             )
            )
  )

(define (multiply r1 r2)
  (simplify (cons (* (car r1) (car r2)) (* (cdr r1) (cdr r2))
                  )
            )
  )

(define (divide r1 r2)
  (simplify (cons (* (car r1) (cdr r2))(* (cdr r1) (car r2)))))