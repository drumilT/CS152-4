#lang racket
(require "q5.rkt")
(define test-tree (leaf 2))
(equal? (convert test-tree) "2")
