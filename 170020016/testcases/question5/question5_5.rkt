#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '+ (node '* (node '+ (leaf 0) (leaf 1)) (node '+ (leaf 2) (leaf 1))) (node '* (node '+ (leaf 4) (leaf 6)) (node '+ (leaf 4) (leaf 8)))) (node '+ (node '* (node '+ (leaf 4) (leaf 4)) (node '+ (leaf 0) (leaf 6))) (node '* (node '* (leaf 4) (leaf 7)) (node '* (leaf 7) (leaf 5))))))
(equal? (convert test-tree) "(0+1)*(2+1)+(4+6)*(4+8)+(4+4)*(0+6)+4*7*7*5")
