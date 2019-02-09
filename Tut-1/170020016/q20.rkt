#lang racket
(define (fib-tr n)
  (let call ([a 0][b 1][itr n])
    (if (zero? itr) a (call b (+ a b) (- itr 1)))
    )
  )