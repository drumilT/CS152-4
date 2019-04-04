#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '+ (node '* (node '* (leaf 6) (leaf 8)) (node '+ (leaf 6) (leaf 6))) (node '+ (node '+ (leaf 5) (leaf 0)) (node '+ (leaf 1) (leaf 9)))) (node '+ (node '+ (node '* (leaf 0) (leaf 6)) (node '* (leaf 6) (leaf 0))) (node '+ (node '* (leaf 9) (leaf 2)) (node '* (leaf 9) (leaf 4))))))
(equal? (convert test-tree) "6*8*(6+6)+5+0+1+9+0*6+6*0+9*2+9*4")
