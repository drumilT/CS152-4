#lang racket
(require "q4b.rkt")
(equal? (evaluate '(29 21 3 17 2 11 20 6) 
				  '(10 6 7 9 4 29)) 187)
