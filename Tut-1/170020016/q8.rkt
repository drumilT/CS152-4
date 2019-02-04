#lang racket
(define (how-many-ways n)
  (if (or (= n 1) (= n 2)) 1
      (if (or (= n 3) (= n 0)) 0 (
       + (+(how-many-ways-lose (- n 1) ) (how-many-ways-lose (- n 2) )) (how-many-ways-lose (- n 4) )
         )
          )
      )
  )

(define (how-many-ways-lose n)
  (if (or (= n 1) (= n 2)) 0
      (if (= n 3) 2 (if (= n 0) 1 (
       + (+(how-many-ways (- n 1) ) (how-many-ways (- n 2) )) (how-many-ways (- n 4) )
         )
          )
      )
  ))