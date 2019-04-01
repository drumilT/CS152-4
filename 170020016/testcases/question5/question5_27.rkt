#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '* (leaf 6) (leaf 2)) (node '+ (leaf 0) (leaf 9))))
(equal? (convert test-tree) "6*2+0+9")
