#lang racket

(define (first3 lst) (append (list (car lst) )(list (cadr lst) )(list (caddr lst) ) ))
(define (club3 lst) (append ( list( first3 lst)) (list (first3 (cdddr lst))) (list(first3 (cdddr (cdddr lst))))))
(define (chec lst) ( equals? (sort (car lst)) '( 1 2 3 4 5 6 7 8 9)))
(define (sudoku-check lst)
  (define (helper lst1 )
    (append (list (append (car( club3 (car lst1))) (car (club3 (cadr lst1))) (car(club3 (caddr lst1)))))
            (list (append (cadr( club3 (car lst1))) (cadr (club3 (cadr lst1))) (cadr(club3 (caddr lst1)))))
            (list (append (caddr( club3 (car lst1))) (caddr (club3 (cadr lst1))) (caddr(club3 (caddr lst1)))))))
   ( helper (car (club3 lst))))