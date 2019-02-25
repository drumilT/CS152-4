#lang racket
(struct bnode (ltree rtree) #:transparent)
(struct leaf (val) #:transparent)

(define (to-tree bm)
  (define pre (foldl (lambda (x y) (if ( < (length y)
                                           (quotient (length bm ) 2))
                                       (append y (list x))
                                       y))
                     '() bm))                     
  (define post ( foldr (lambda (x y) (if ( < (length y)
                                           (quotient (length bm ) 2))
                                       (append  (list x) y)
                                       y))
                     '() bm))  
  ( cond [(and (test pre) ( test post)) (bnode (leaf (car pre)) (leaf ( car post)))]
         [(and (test pre) ( not ( test post))) (bnode (leaf (car pre)) (to-tree post))]
         [(and ( not (test pre)) ( not ( test post))) (bnode (to-tree pre)( to-tree post))]
         [(and ( not (test pre)) ( test post)) (bnode (to-tree pre) (leaf ( car post)))]
  ))

(define (test lst)
  ( foldl ( lambda ( x y ) ( and y (equal? x (car lst)))) #t lst))

( define ( bitwise-or bt1 bt2)
   ( match (list bt1 bt2) [(list (bnode ltree1 rtree1) (bnode ltree2 rtree2)) (bnode (bitwise-or ltree1 ltree2)
      (bitwise-or rtree1 rtree2))]
      [(list (bnode ltree1 rtree1) (leaf 1)) (leaf 1)]
      [(list (leaf 1) (bnode ltree1 rtree1)) (leaf 1)]
      [(list (bnode ltree1 rtree1 ) (leaf 0)) (bnode ltree1 rtree1)]
      [(list (leaf 0) (bnode ltree1 rtree1)) (bnode ltree1 rtree1)]
      [(list (leaf a) (leaf b)) (leaf (ort a b))]))
(define (ort a b)
  ( if ( zero? (+ a b)) 0 1))

(define ( findvalue index n bt)
  (match bt [(bnode ltree rtree) (if (> index (quotient n 2))
                                     (findvalue ( - index (quotient n 2))
                                                (quotient n 2)
                                                rtree)
                                      (findvalue index
                                                (quotient n 2)
                                                ltree)
                                     )]
    [(leaf a) a]))

      