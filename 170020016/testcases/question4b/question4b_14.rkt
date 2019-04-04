#lang racket
(require "q4b.rkt")
(equal? (evaluate '(2 3 4 5 6 7 8 9 10)
'(2 25 6 77 64)) 27)