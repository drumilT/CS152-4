#lang racket
(require "q5.rkt")
(define test-tree (node '* (node '+ (node '* (leaf 2) (leaf 9)) (node '* (leaf 1) (leaf 7))) (node '+ (node '* (leaf 8) (leaf 2)) (node '+ (leaf 5) (leaf 9)))))
(equal? (convert test-tree) "(2*9+1*7)*(8*2+5+9)")
