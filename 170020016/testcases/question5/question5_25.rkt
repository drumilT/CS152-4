#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '+ (node '+ (leaf 9) (leaf 5)) (node '+ (leaf 7) (leaf 8))) (node '* (node '* (leaf 2) (leaf 1)) (node '* (leaf 6) (leaf 2)))))
(equal? (convert test-tree) "9+5+7+8+2*1*6*2")
