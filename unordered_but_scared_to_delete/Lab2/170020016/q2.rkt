#lang racket
(define (dia a b c)
  (if (zero? (remainder c (gcd a b))) #t #f))

(define (gcd a b)
  (if (zero? b) a ( gcd b (remainder a b ) )))