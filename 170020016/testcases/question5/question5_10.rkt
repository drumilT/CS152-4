#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '* (node '* (leaf 9) (leaf 9)) (node '* (leaf 3) (leaf 7))) (node '+ (node '* (leaf 5) (leaf 1)) (node '+ (leaf 5) (leaf 1)))))
(equal? (convert test-tree) "9*9*3*7+5*1+5+1")
