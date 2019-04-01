#lang racket
(require "q5.rkt")
(define test-tree (node '* (node '+ (node '+ (node '+ (node '* (leaf 7) (leaf 5)) (node '* (leaf 0) (leaf 7))) (node '* (node '* (leaf 4) (leaf 4)) (node '* (leaf 6) (leaf 6)))) (node '+ (node '* (node '* (leaf 0) (leaf 3)) (node '* (leaf 6) (leaf 3))) (node '+ (node '* (leaf 5) (leaf 7)) (node '* (leaf 8) (leaf 7))))) (node '+ (node '+ (node '* (node '+ (leaf 1) (leaf 9)) (node '+ (leaf 7) (leaf 7))) (node '* (node '+ (leaf 6) (leaf 5)) (node '* (leaf 1) (leaf 8)))) (node '* (node '* (node '+ (leaf 6) (leaf 1)) (node '+ (leaf 4) (leaf 0))) (node '+ (node '+ (leaf 4) (leaf 8)) (node '* (leaf 0) (leaf 1)))))))
(equal? (convert test-tree) "(7*5+0*7+4*4*6*6+0*3*6*3+5*7+8*7)*((1+9)*(7+7)+(6+5)*1*8+(6+1)*(4+0)*(4+8+0*1))")
