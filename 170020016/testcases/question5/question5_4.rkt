#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '+ (node '* (leaf 4) (leaf 2)) (node '+ (leaf 0) (leaf 7))) (node '* (node '+ (leaf 7) (leaf 9)) (node '+ (leaf 3) (leaf 7)))))
(equal? (convert test-tree) "4*2+0+7+(7+9)*(3+7)")
