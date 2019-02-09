#lang racket
(define (is-Carmichael n)
  (define (is-prime n) (let call ([num (- n 1)])(if (= num 1 ) #t (if (zero?
                                                       (remainder n num ))
                                                      #f (call (- num 1))))))
  (define (helper num n)(if (= num 1) #t
                            (if (and (zero? (remainder n num)) (is-prime num))
                                ( and (= 0 (remainder (- n 1) ( - num 1)))
                                             (helper (- num 1) n))
                                 ( helper (- num 1) n))
                            )
    )
  (helper (- n 1 ) n )
    )