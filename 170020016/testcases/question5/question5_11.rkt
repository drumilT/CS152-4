#lang racket
(require "q5.rkt")
(define test-tree (node '* (node '* (leaf 7) (leaf 1)) (node '+ (leaf 7) (leaf 1))))
(equal? (convert test-tree) "7*1*(7+1)")
