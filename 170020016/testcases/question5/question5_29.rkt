#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '* (node '+ (node '+ (node '+ (leaf 2) (leaf 0)) (node '+ (leaf 9) (leaf 0))) (node '+ (node '+ (leaf 4) (leaf 2)) (node '+ (leaf 7) (leaf 3)))) (node '+ (node '* (node '+ (leaf 4) (leaf 0)) (node '* (leaf 1) (leaf 9))) (node '* (node '* (leaf 0) (leaf 4)) (node '+ (leaf 9) (leaf 1))))) (node '+ (node '+ (node '* (node '* (leaf 2) (leaf 2)) (node '+ (leaf 5) (leaf 7))) (node '+ (node '+ (leaf 5) (leaf 2)) (node '+ (leaf 2) (leaf 3)))) (node '* (node '* (node '* (leaf 7) (leaf 7)) (node '+ (leaf 2) (leaf 1))) (node '* (node '+ (leaf 7) (leaf 5)) (node '+ (leaf 9) (leaf 4)))))))
(equal? (convert test-tree) "(2+0+9+0+4+2+7+3)*((4+0)*1*9+0*4*(9+1))+2*2*(5+7)+5+2+2+3+7*7*(2+1)*(7+5)*(9+4)")
