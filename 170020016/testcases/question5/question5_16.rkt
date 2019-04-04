#lang racket
(require "q5.rkt")
(define test-tree (node '* (node '+ (node '* (node '* (node '+ (node '* (leaf 8) (leaf 2)) (node '* (leaf 9) (leaf 5))) (node '* (node '+ (leaf 1) (leaf 2)) (node '+ (leaf 9) (leaf 8)))) (node '+ (node '* (node '* (leaf 3) (leaf 7)) (node '+ (leaf 7) (leaf 4))) (node '* (node '* (leaf 9) (leaf 6)) (node '+ (leaf 7) (leaf 4))))) (node '+ (node '+ (node '+ (node '* (leaf 1) (leaf 6)) (node '* (leaf 7) (leaf 2))) (node '* (leaf 2) (node '* (leaf 2) (leaf 3)))) (node '* (node '+ (node '+ (leaf 0) (leaf 2)) (node '* (leaf 7) (leaf 0))) (node '* (node '+ (leaf 1) (leaf 8)) (node '+ (leaf 0) (leaf 8)))))) (node '+ (node '* (node '* (node '* (node '+ (leaf 6) (leaf 1)) (node '+ (leaf 8) (leaf 2))) (node '+ (node '+ (leaf 1) (leaf 2)) (node '+ (leaf 9) (leaf 3)))) (node '* (node '* (node '+ (leaf 3) (leaf 3)) (node '+ (leaf 7) (leaf 1))) (node '+ (node '+ (leaf 2) (leaf 1)) (node '+ (leaf 4) (leaf 5))))) (node '* (node '* (node '* (node '+ (leaf 1) (leaf 7)) (node '* (leaf 6) (leaf 9))) (node '+ (node '+ (leaf 3) (leaf 5)) (node '* (leaf 6) (leaf 3)))) (node '* (node '* (node '+ (leaf 1) (leaf 9)) (node '* (leaf 0) (leaf 0))) (node '* (node '+ (leaf 5) (leaf 6)) (node '+ (leaf 6) (leaf 4))))))))
(equal? (convert test-tree) "((8*2+9*5)*(1+2)*(9+8)*(3*7*(7+4)+9*6*(7+4))+1*6+7*2+2*2*3+(0+2+7*0)*(1+8)*(0+8))*((6+1)*(8+2)*(1+2+9+3)*(3+3)*(7+1)*(2+1+4+5)+(1+7)*6*9*(3+5+6*3)*(1+9)*0*0*(5+6)*(6+4))")