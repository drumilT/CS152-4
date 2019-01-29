#lang racket

(define (last l)
  ( if (null? (cdr l))(car l)(last (cdr l))
                 ))

(define (last-but-one l)
  ( if (null? (cdr (cdr l)))(car l)(last-but-one (cdr l))
                 ))

(define (kth-element lst k)
  ( if (zero? (- k 1))( car lst)(kth-element (cdr lst) (- k 1))))

(define (is-palindrome lst)
  ( if ( equal? (reverse lst) lst ) #t #f))

(define (flatten lst)
  (if (pair? (car lst))
      (append (flatten (car lst)) (flatten (cdr lst)))
      (append (car lst) (flatten (cdr lst)))
      )
   )

(define (remove-consecutive lst)
  (foldr (lambda (x y)(if (null? (car y))
                          (list x)
                       (if (not (equal? x (car y)))
                          (append (list x) y) y))) '(()) lst)
  )

(define (find-out k lst) (foldr (lambda (x y) (if y y (if (equal? k x) #t #f))) #f lst))

(define (remove-duplicates lst)
  
  (foldl (lambda (x y)(if (null? (car y))
                          (list x)
                       (if (find-out x y)
                          y (append y (list x) ) ))) '(()) lst)
  )

(define (pack lst)
  (foldr (lambda (x y) (if (null? y)
                           (list (list x))
                           (if (equal? x (car (car y)))
                               (cons (cons x (car y))(cdr y))
                               (cons (list x) y)
                               )
                           
           )) '() lst)
  )

(define (drop lst num)
  )
  
