#lang racket
(define (monte-carlo pred x1 x2 y1 y2 itrm)
  (define (scaled-random x1 x2)
(+ x1 (* (random)
(- x2 x1))))
  (define (check x y) (if (pred x y) 1 0))
  (let call([itr itrm][true 0])(if (zero? itr)
                                  (* true (/ (* (- x2 x1)(- y2 y1)) itrm)) 
                                  (call (- itr 1)
                                        (+ true (check
                                                 (scaled-random x1 x2)
                                                 (scaled-random y1 y2)
                                               
                                                 )
                                           )
                                        )
                                  )
    )
    )

(define (try) (monte-carlo (lambda (x y) (if (<= (+ ( * x x) (* y y)) 1) #t #f)
                           )-1 1 -1 1 9876543210))