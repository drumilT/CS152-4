#lang racket
(provide evaluate)
(provide evaluate)
(provide evaluate)
(provide evaluate)
(provide evaluate)
(provide evaluate)
(define (between x low high)
  (and (<= low x) (<= x high)))

(define  (mult8 a b)
  (cond [(and (between a 0 255) (between b 0 255)) (* a b)]
        [else (error "Arguments not in range")]))

(define  (div8 a b)
  (cond [(and (between a 0 255) (between b 1 255)) (quotient a b)]
        [else (error "Arguments not in range")]))

( define ( evaluate a b)
   ( if ( null? b ) ( foldr ( lambda (x y) ( mult8 x y) ) 1 a)
        ( if (= (car b) 1 ) (evaluate a (cdr b) )
             ( evaluate (red1 a b) (red2 a b) )))
)

;( define (red1 a b)
;())