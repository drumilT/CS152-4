#lang racket
(require "q5.rkt")
(define test-tree (node '+ (node '* (leaf 4) (leaf 6)) (node '* (leaf 6) (leaf 8))))
(equal? (convert test-tree) "4*6+6*8")
