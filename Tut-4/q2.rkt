#lang racket

(define (to-decimal lst)
  ;;(string->number (list->string lst)))
(exact->inexact (car (tdo-decimal lst))))

(define (tdo-decimal lst)
  (foldl (lambda (x y) (if (equal? x #\.) (cons (car y) 1 )
                         (if ( zero?(cdr y)) (cons (+ ( - (char->integer x) 48) ( * (car y) 10)) (cdr y))
                             (begin
                               (set! y (cons (car y) ( + (cdr y) 1)))
                               (cons (+ (car y) (* ( - (char->integer x) 48) (expt 10 ( * (- (cdr y) 1) -1))))
                             (cdr y)))
                         )
           )
         )
         (cons 0 0 )
         lst
         )
  
  )