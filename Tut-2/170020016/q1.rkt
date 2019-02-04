#lang racket

(define (last l)
  ( if (null? (cdr l))(car l)(last (cdr l))
                 ))

