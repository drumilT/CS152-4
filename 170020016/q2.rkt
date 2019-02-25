#lang racket

(define (remainder-expt a pw mod)
  (if (= pw 0) 1
      (let*[(r (remainder-expt a (quotient pw 2) mod))
            (sq (remainder (* r r) mod))]
        (if (even? pw)
            sq
            (remainder (* sq a) mod)))))


(define (prime-check p itr cond)
  (if (= itr 0) cond (prime-check p ( - itr 1) ( and cond
                           ( = 1 ( remainder-expt ( + 1 (random (- p 1 ))) (- p 1) p ))
                           ))
                           ))


( define ( age x)
   ( if ( and (prime-check x 15 #t) (prime-check (- x 10) 15 #t)) x (age (+ x 1))))


;( define (prime n a)
;   (if ( > a 1) (and (not( zero? (remainder n a))) (prime  n (- a 1))) #t))
