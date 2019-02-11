#lang racket
(struct node (value ltree rtree) #:transparent)
(struct nulltree () #:transparent)
(define t1
(node 10
(node 10
(node 5 (nulltree) (nulltree))
(nulltree))
(node 15 (nulltree) (nulltree))))

(define (list-within t ub lb)
  (match t [(nulltree) '()]
         [(node val lt rt)
          (cond [( and ( <=  val ub) (>= val lb)) (append (list-within lt ub lb) (list val) (list-within rt ub lb) )]
                [( > val ub ) (list-within lt ub lb) ]
                [( < val lb ) (list-within rt ub lb) ]
                )]))