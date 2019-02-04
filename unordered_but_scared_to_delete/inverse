#lang racket
(define (inverse e n)
  ( if (= (gcd e n) 1) (modulo (expt e (- (totient n) 1)) n ) #f)
  )

(define (totient n)
  (let call ([a n] [ph n])(if (zero? a ) ph 
                           (if (and (zero? (remainder n a)) (prime a))
                               (call (- a 1) (* (- a 1) (/ ph a)))
                                   (call ( - a 1) ph)  )
                              ))
    )
  

(define (prime n)
  (if (or (zero? n) (= n 1)) #f
  (let call2 ([a 2])
    (if (= n a) #t
        (if (zero? (remainder n a)) #f (call2 (+ a 1)))))))