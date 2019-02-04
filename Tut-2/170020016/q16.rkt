#lang racket
(define (reverse-tail lst)
  (define (rever-helper lst1 lst2)

    ( if (null? lst1) lst2 (rever-helper (cdr lst1) (append (list (car lst1)) lst2)
                                          )
         )
    )
  ( rever-helper lst '())
  )
  