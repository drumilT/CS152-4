#lang racket
(struct node ( val ltree rtree) #:transparent)
(struct leaf(val) #:transparent)

(define t4 (node 2 
                 (leaf 1 )
                 (leaf 3 )))
(define t6 (leaf 6 ))
(define t7 (node 2  (leaf 7 )
                 (leaf 9 )))
(define t8 (node 8 (leaf 7 )
                 (leaf 9 )))  
(define t10 (node 12 (leaf 11 )
                  (leaf 13 )))
(define t11 (node 16 (leaf 15 )
                  (leaf 17 )))
(define t9 (node 14 t10 t11))
(define t3 (node 10  t8 t9))
(define t5 (leaf 5 ))
(define t2 (node 4  t4 t5))
(define t1 (node 6 t2 t3))
(define (height t)
  (match t
      [(node v lt rt) ( + 1 (max (height lt) (height rt))) ]
       [(leaf val) 1 ]))

(define (dia t)
   (match t [(node v ltree rtree) (max ( + 1 (height rtree)
                                           (height ltree))
                                      (dia ltree)
                                      (dia rtree))]
           [(leaf val) 0]))
  