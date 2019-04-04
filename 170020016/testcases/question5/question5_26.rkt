#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '+ (node '* (node '+ (node '+ (node '* (leaf 0) (leaf 7)) (node '+ (leaf 2) (leaf 8))) (node '* (node '+ (leaf 1) (leaf 3)) (node '* (leaf 1) (leaf 0)))) (node '+ (node '* (node '* (leaf 0) (leaf 6)) (node '* (leaf 8) (leaf 1))) (node '+ (node '+ (leaf 3) (leaf 4)) (node '* (leaf 1) (leaf 7))))) (node '* (node '+ (node '+ (node '* (leaf 3) (leaf 6)) (node '+ (leaf 6) (leaf 3))) (node '* (node '* (leaf 4) (leaf 7)) (node '+ (leaf 8) (leaf 9)))) (node '+ (node '+ (node '* (leaf 8) (leaf 9)) (node '+ (leaf 4) (leaf 6))) (node '* (node '+ (leaf 3) (leaf 1)) (node '+ (leaf 5) (leaf 3)))))) (leaf 3)))
(equal? (convert test-tree) "(0*7+2+8+(1+3)*1*0)*(0*6*8*1+3+4+1*7)+(3*6+6+3+4*7*(8+9))*(8*9+4+6+(3+1)*(5+3))+3")
