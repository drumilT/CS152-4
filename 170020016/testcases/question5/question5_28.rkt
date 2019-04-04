#lang racket
(require "q5.rkt")
(define test-tree (node '* (node '+ (leaf 0) (leaf 2)) (node '+ (leaf 5) (leaf 3))))
(equal? (convert test-tree) "(0+2)*(5+3)")
