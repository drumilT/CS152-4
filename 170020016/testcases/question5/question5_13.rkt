#lang racket
(require "q5.rkt")
(define test-tree (node '* (node '+ (node '* (leaf 6) (leaf 6)) (node '* (leaf 4) (leaf 5))) (node '+ (node '+ (leaf 2) (leaf 1)) (node '* (leaf 9) (leaf 9)))))
(equal? (convert test-tree) "(6*6+4*5)*(2+1+9*9)")
