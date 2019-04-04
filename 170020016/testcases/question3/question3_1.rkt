#lang racket
(require "q3.rkt")
(equal? (diff '(1 0 1 1 1 -1 0 1 -1 1 0 -1 -1 )) 0)
