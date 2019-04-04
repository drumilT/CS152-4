#lang racket
(require "q4b.rkt")
(equal? (evaluate '(15 10 1 3 19 19 6 19 2 9)
				'(9 2 19 6 19 19 15 10 1 3)) 1)