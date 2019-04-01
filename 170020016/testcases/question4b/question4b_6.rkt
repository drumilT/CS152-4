#lang racket
(require "q4b.rkt")
(equal? (evaluate '(10 3 18 27 4 17 11 28)
				'(243 5 64 3 7)) 187)
