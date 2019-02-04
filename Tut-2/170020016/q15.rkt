#lang racket
(define (fewest-moves lst)
  (cond [(= (length lst) 0) 0]
        [(= (length lst) 1) 10000000]
        [(= (length lst) 2) 1]
        [(and (= (car lst) 0) (>= (length lst) 4)) ( + 1 (min (fewest-moves (cddddr lst)) (fewest-moves (cdr lst))))]
        [(and (= (car lst) 1) (>= (length lst) 2)) ( + 1 (min (fewest-moves (cddr lst)) (fewest-moves (cdr lst))))]
        [else (+ 1 (fewest-moves (cdr lst))) ]
))