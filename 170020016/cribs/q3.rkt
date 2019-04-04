#lang racket
(provide diff)
(provide diff)
(provide diff)
(provide diff)
(provide diff)
(provide diff)
(define (diff lst)
  (helper 0 0 lst))

(define ( helper sc1 sc2 lst)
  (if ( null? lst )  (- sc2 sc1)
      (helper sc2 ( + sc1 ( cond
                             [(>= (car lst) (car ( reverse lst))) (car lst)]
                             [else (car ( reverse lst))]))
              ( cond
                             [(>= (car lst) (car ( reverse lst))) (cdr lst)]
                             [else (reverse (cdr ( reverse lst)))]))))



(define ( helper2 sc1 sc2 lst)
  (if ( null? lst ) (- sc1 sc2)
   ( max (helper2 sc2 ( + sc1  (car lst)) (cdr lst)) (helper2 sc2 ( + sc1 (car ( reverse lst))) (reverse (cdr ( reverse lst)))))  ))