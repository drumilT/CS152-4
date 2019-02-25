#lang racket
(provide (all-defined-out))
(struct node (val ltree rtree) #:transparent)
(struct leaf (num) #:transparent)

(define (convert t)
  (helper t  #f))

(define (helper t fl)
  (match t 
    [( node '+ (leaf v1) (leaf v2)) (if fl ( string-append (~a #\()
                                                           (~a v1 )
                                                           "+"
                                                           (~a v2 )
                                                           (~a #\)))
                                               ( string-append 
                                                           (~a v1 )
                                                           "+"
                                                           (~a v2 )
                                                           ))
                                                           ]
    [( node '* (leaf v1) (leaf v2)) ( string-append
                                                           (~a v1 )
                                                           "*"
                                                           (~a v2 )
                                                           )
                                              
                                                           ]
    [ else (string-append (if ( and fl ( equal? (node-val t) '+))  (~a #\() "")
                          (helper (node-ltree t) ( equal? (node-val t) '*))
                          (if ( equal? (node-val t) '*) "*" "+")
                          (helper (node-rtree t) ( equal? (node-val t) '*))
                          (if ( and fl ( equal? (node-val t) '+))  (~a #\)) ""))
    ]
    ))

(define try (node '* (node '+ (leaf 5) (leaf 2)) ( node '* (leaf 3) (leaf 4))))
(define s 2 )