#lang racket
(require "q4b.rkt")
(equal? (evaluate '(2 3 4 5 6 7 8 9 10)
'(2 18 10 90)) 112)