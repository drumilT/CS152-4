#lang racket
(require "q4b.rkt")
(equal? (evaluate '(2 31 41 5 6 7 8 9 10)
'(2 180 30 7 4 31)) 41)