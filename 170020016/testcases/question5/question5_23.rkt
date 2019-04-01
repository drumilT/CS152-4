#lang racket
(require "q5.rkt")
(define test-tree (node '* (node '+ (node '* (node '* (node '+ (leaf 5) (leaf 0)) (node '* (leaf 7) (leaf 0))) (node '+ (node '* (leaf 8) (leaf 0)) (node '* (leaf 3) (leaf 8)))) (node '* (node '* (node '+ (leaf 4) (leaf 1)) (node '+ (leaf 5) (leaf 2))) (node '* (node '* (leaf 9) (leaf 3)) (node '+ (leaf 6) (leaf 6))))) (node '+ (node '* (node '* (node '+ (leaf 8) (leaf 8)) (node '* (leaf 4) (leaf 1))) (node '* (node '* (leaf 1) (leaf 8)) (node '+ (leaf 8) (leaf 5)))) (node '* (node '+ (node '* (leaf 6) (leaf 2)) (leaf 6)) (node '* (node '+ (leaf 8) (leaf 6)) (node '+ (leaf 0) (leaf 6)))))))
(equal? (convert test-tree) "((5+0)*7*0*(8*0+3*8)+(4+1)*(5+2)*9*3*(6+6))*((8+8)*4*1*1*8*(8+5)+(6*2+6)*(8+6)*(0+6))")
