#lang racket

(define (kth-element lst k)
  ( if (zero? (- k 1))( car lst)(kth-element (cdr lst) (- k 1))))

