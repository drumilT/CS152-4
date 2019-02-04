#lang racket
(define (coeffs a b)
  
  (let call ([a1 a][b1 b] [xa 1] [ya 0] [xb 0] [yb 1])
     (if (zero? b1)
        (cons xa ya)
        ( call b1 (remainder a1 b1 )
               xb yb
               (- xa (* (quotient a1 b1) xb)) (- ya (* (quotient a1 b1) yb) )
               )
        )
    
  ))