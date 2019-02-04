#lang racket
(define (modexp x y n)
  (if (zero? y) 1 (if (even? y)
                     ( modulo (expt (modulo (modexp x (/ y 2) n) n) 2) n)
                     (modulo(*
                             x
                             (modulo (expt (modulo (modexp x (quotient y 2) n) n) 2) n))
                            n)
                     )
      )
  )