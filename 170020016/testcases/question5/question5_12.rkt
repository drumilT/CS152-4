#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '+ (node '* (leaf 3) (leaf 5)) (node '* (leaf 2) (leaf 3))) (node '* (node '* (leaf 6) (leaf 0)) (node '* (leaf 1) (leaf 6)))))
(equal? (convert test-tree) "3*5+2*3+6*0*1*6")
