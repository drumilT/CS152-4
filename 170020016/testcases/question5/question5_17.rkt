#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '+ (node '* (node '* (node '+ (leaf 1) (leaf 2)) (node '+ (leaf 7) (leaf 8))) (node '* (node '+ (leaf 9) (leaf 6)) (node '* (leaf 0) (leaf 9)))) (node '* (node '+ (node '+ (leaf 7) (leaf 7)) (node '* (leaf 5) (leaf 4))) (node '+ (node '* (leaf 4) (leaf 1)) (node '* (leaf 2) (leaf 2))))) (node '* (node '+ (node '* (node '* (leaf 7) (leaf 3)) (node '+ (leaf 9) (leaf 6))) (node '+ (node '* (leaf 1) (leaf 0)) (node '* (leaf 4) (leaf 9)))) (node '+ (node '* (node '* (leaf 7) (leaf 2)) (node '* (leaf 9) (leaf 9))) (node '* (node '+ (leaf 8) (leaf 5)) (node '* (leaf 8) (leaf 9)))))))
(equal? (convert test-tree) "(1+2)*(7+8)*(9+6)*0*9+(7+7+5*4)*(4*1+2*2)+(7*3*(9+6)+1*0+4*9)*(7*2*9*9+(8+5)*8*9)")
