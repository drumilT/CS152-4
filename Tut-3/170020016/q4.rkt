#lang racket

(require "list-comprehension.rkt")
(struct node (ltree rtree) #:transparent)
(struct leaf () #:transparent)

( define ( mirror t)
   (match t [ (leaf) (leaf) ]
            [(node lt rt ) (node (mirror rt)( mirror lt)) ]
            ['() '()]
     ))

(define (helper n )
  ( if(< n 0) '() ( append (list (- n 1)) (helper (- n 1 )) ))                            )
      
( define ( gen n)
   (if (zero? n) (list null )(if (=  n 1) (list (leaf))
       (lc (node a b) : help <- (helper n) a <- (gen  help) b <- (gen (- n help  1))))))

(define ( all-sym-trees n)
  ( if  ( = n 1) (list (leaf))
  ( lc ( node a (mirror a)) : a <- (gen ( quotient n 2))))) 