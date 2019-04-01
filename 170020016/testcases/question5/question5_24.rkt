#lang racket
(require "q5.rkt")
(define test-tree (node '* (node '+ (node '* (node '* (leaf 6) (leaf 0)) (node '+ (leaf 5) (leaf 2))) (node '* (node '+ (leaf 3) (leaf 3)) (node '+ (leaf 9) (leaf 0)))) (node '* (node '+ (node '+ (leaf 9) (leaf 0)) (node '* (leaf 7) (leaf 1))) (node '+ (node '+ (leaf 6) (leaf 4)) (node '* (leaf 3) (leaf 1))))))
(equal? (convert test-tree) "(6*0*(5+2)+(3+3)*(9+0))*(9+0+7*1)*(6+4+3*1)")
