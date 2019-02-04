#lang racket
(define (is_prime n)
  (let call ([num (random 5000)][itr 10])
    (if (zero? itr) #t 
    (if (= (modulo (expt num (- n 1))n) 1)
        (call (random 5000) ( - itr 1))
        #f)
    )
    )
  )
