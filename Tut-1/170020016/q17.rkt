#lang racket
(define (simpson f a b n)
  (let call([val 0][itr (- n 1 )][h (/ (- a b) n)])
    (if (= itr 0) ( + val (* ( / h 3 ) (+ (f a) (f b)) ))
        (if (= (remainder itr 2) 1)
            (call (+ val  (* ( / h 3 ) (* 4 (f (+ a (* itr h)))))) (- itr 1) h)
            (call (+ val  (* ( / h 3 ) (* 2 (f (+ a (* itr h)))))) (- itr 1) h)
            )
        )
    )
  )

(define (try)
  (simpson (lambda (x) (* x x) ) 0 10 1000))

