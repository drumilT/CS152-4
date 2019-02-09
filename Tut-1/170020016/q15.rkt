#lang racket
 (define (filtered-accumulate lb ub func pred id)
   ( define (helper num ub func pred val)
      (if (= 1 (- num ub) ) val ( if (pred num) (helper (+ 1 num) ub func pred (func num val))
                                     (helper (+ 1 num) ub func pred val))
      ))
 (helper lb ub func pred id)
   )

 (define (f0 lb ub)
   (filtered-accumulate lb ub
                        (lambda (x y)(+ y x))
                        (lambda (x) (if (= (remainder x 13) 1) #t #f))
                        0))
 (define (f1 lb ub)
   (filtered-accumulate lb ub
                        (lambda (x y)(+ y (* x x)))
                        (lambda (x) (if (= (remainder x 2) 1) #t #f))
                        0))

 (define (f2 lb ub)
   (define (fact x) (if (zero? x) 1 (* x (fact (- x 1)))))
   (filtered-accumulate lb ub
                        (lambda (x y)(* y (fact x)))
                        (lambda (x) (if (= (remainder x 3) 0) #t #f))
                        1))

 (define (f3 lb ub)
   (define (is-prime n) (let call ([num (- n 1)])(if (<= num 1 ) #t (if (zero?
                                                       (remainder n num ))
                                                      #f (call (- num 1))))))
  (filtered-accumulate lb ub
                        (lambda (x y)(+ y (* x x)))
                        (lambda (n) (and (not (= n 1)) (is-prime n)))
                        0))