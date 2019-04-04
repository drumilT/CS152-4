#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '+ (node '* (leaf 4) (leaf 7)) (node '+ (leaf 0) (leaf 0))) (node '* (node '* (leaf 0) (leaf 2)) (node '+ (leaf 6) (leaf 3)))))
(equal? (convert test-tree) "4*7+0+0+0*2*(6+3)")
