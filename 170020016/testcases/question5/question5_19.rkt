#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '* (node '+ (node '* (node '+ (leaf 4) (leaf 7)) (node '+ (leaf 4) (leaf 8))) (node '+ (node '* (leaf 8) (leaf 9)) (node '+ (leaf 7) (leaf 1)))) (node '* (node '* (node '+ (leaf 7) (leaf 4)) (node '+ (leaf 6) (leaf 6))) (node '+ (node '* (leaf 6) (leaf 3)) (node '+ (leaf 8) (leaf 5))))) (node '+ (node '* (node '* (node '* (leaf 6) (leaf 0)) (node '+ (leaf 5) (leaf 6))) (node '* (node '* (leaf 9) (leaf 9)) (node '* (leaf 7) (leaf 2)))) (node '* (node '* (node '+ (leaf 0) (leaf 2)) (node '* (leaf 5) (leaf 8))) (node '* (node '+ (leaf 3) (leaf 3)) (node '+ (leaf 2) (leaf 1)))))))
(equal? (convert test-tree) "((4+7)*(4+8)+8*9+7+1)*(7+4)*(6+6)*(6*3+8+5)+6*0*(5+6)*9*9*7*2+(0+2)*5*8*(3+3)*(2+1)")
