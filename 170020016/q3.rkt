#lang racket
(define (diff lst)
  (helper2 0 0 lst))

(define ( helper sc1 sc2 lst)
  (if ( null? lst )  (- sc2 sc1)
      (helper sc2 ( + sc1 ( cond
                             [(>= (car lst) (car ( reverse lst))) (car lst)]
                             [else (car ( reverse lst))]))
              ( cond
                             [(>= (car lst) (car ( reverse lst))) (cdr lst)]
                             [else (reverse (cdr ( reverse lst)))]))))



(define ( helper2 sc1 sc2 lst)
  (if ( null? lst ) 0
   ( max ( - (car lst) (helper2 0 0 (cdr lst))) (- (car ( reverse lst)) ( helper2 0 0 (reverse (cdr ( reverse lst)))))  )))
