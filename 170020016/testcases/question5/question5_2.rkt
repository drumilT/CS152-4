#lang racket
(require "q5.rkt")
(define test-tree (node '* (leaf 2) (leaf 2)))
(equal? (convert test-tree) "2*2")
