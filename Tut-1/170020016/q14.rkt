#lang racket
( define (decode p q e c)
   (define (findD val e d )
     (if (= (remainder (* e d) val) 1) d (findD val e (+ d 1))
         )
     )
   ( remainder (expt c (findD (* ( - p 1)(- q 1)) e 1)) (* p q))
   )
   