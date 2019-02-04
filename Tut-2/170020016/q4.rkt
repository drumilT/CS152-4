#lang racket

(define (is-palindrome lst)
  ( if ( equal? (reverse lst) lst ) #t #f))

