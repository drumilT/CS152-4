#lang racket
( define ( lcs l1 l2)
   ( if (or ( null? l1 )(null? l2)) '()
        (if ( equal? (car l2)(car l1)) (append (list ( car l1) ) (lcs ( cdr l1)(cdr l2)))
            ( max-length (lcs l1(cdr l2)) (lcs ( cdr l1) l2)))))

( define ( max-length l1 l2)
   ( if ( > (length l1) (length l2)) l1 l2))