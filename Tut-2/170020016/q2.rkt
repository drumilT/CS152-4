#lang racket

(define (last-but-one l)
  ( if (null? (cdr (cdr l)))(car l)(last-but-one (cdr l))
                 ))

