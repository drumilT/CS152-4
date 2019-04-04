#lang racket
(require "q5.rkt")
(define test-tree (node '* (node '* (node '+ (node '+ (leaf 7) (leaf 9)) (node '* (leaf 9) (leaf 1))) (node '* (node '+ (leaf 1) (leaf 7)) (node '* (leaf 1) (leaf 6)))) (node '* (node '* (node '+ (leaf 6) (leaf 8)) (node '* (leaf 2) (leaf 5))) (node '+ (node '+ (leaf 1) (leaf 1)) (node '* (leaf 9) (leaf 4))))))
(equal? (convert test-tree) "(7+9+9*1)*(1+7)*1*6*(6+8)*2*5*(1+1+9*4)")
