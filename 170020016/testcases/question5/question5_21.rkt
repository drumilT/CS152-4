#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '* (node '* (node '+ (node '* (leaf 7) (leaf 9)) (node '* (leaf 3) (leaf 5))) (node '+ (node '* (leaf 7) (leaf 7)) (node '* (leaf 0) (leaf 7)))) (node '+ (node '+ (node '* (leaf 0) (leaf 2)) (node '* (leaf 1) (leaf 1))) (node '+ (node '+ (leaf 4) (leaf 4)) (node '+ (leaf 0) (leaf 0))))) (node '* (node '* (node '* (node '* (leaf 5) (leaf 8)) (node '* (leaf 1) (leaf 2))) (node '* (node '* (leaf 7) (leaf 4)) (node '* (leaf 4) (leaf 9)))) (node '* (node '+ (node '* (leaf 4) (leaf 3)) (node '+ (leaf 9) (leaf 1))) (node '+ (node '* (leaf 5) (leaf 9)) (node '+ (leaf 4) (leaf 4)))))))
(equal? (convert test-tree) "(7*9+3*5)*(7*7+0*7)*(0*2+1*1+4+4+0+0)+5*8*1*2*7*4*4*9*(4*3+9+1)*(5*9+4+4)")
