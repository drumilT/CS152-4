#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '* (node '+ (node '+ (leaf 3) (leaf 6)) (node '+ (leaf 2) (leaf 7))) (node '+ (node '* (leaf 7) (leaf 4)) (node '* (leaf 7) (leaf 0)))) (node '* (node '+ (node '+ (leaf 8) (leaf 5)) (node '+ (leaf 4) (leaf 1))) (node '+ (node '+ (leaf 2) (leaf 9)) (node '+ (leaf 0) (leaf 6))))))
(equal? (convert test-tree) "(3+6+2+7)*(7*4+7*0)+(8+5+4+1)*(2+9+0+6)")
