#lang racket
(require 2htdp/batch-io)
(require "decision_functions_sig.rkt")

;input dataset
(provide toytrain)
(define toytrain "../data/toy_train.csv")

(provide titanictrain)
(define titanictrain "../data/titanic_train.csv")

(provide mushroomtrain)
(define mushroomtrain "../data/mushroom_train.csv")

;output tree (dot file)
(provide toyout)
(define toyout "../output/toy-decision-tree.dot")

;reading input datasets
;read the csv file myfile as a list of strings
;with each line of the original file as an element of the list
;further split each line at commas
;so then we have a list of list of strings
(provide toy-raw)
(define toy-raw (cdr (read-csv-file "../data/toy_train.csv")))

(provide titanic-raw)
(define titanic-raw ( map (lambda (x) ( cddr x)) (cdr (read-csv-file "../data/titanic_train.csv"))))

(provide mushroom-raw)
(define mushroom-raw (cdr (read-csv-file "../data/mushrooms_train.csv")))

;function to convert data to internal numerical format
;(features . result)
(provide format)
(define (format data) (map  ( lambda (x1)
                               ( cons (map ( lambda (x2) (string->number x2)) (cdr x1)) (string->number(car x1))))                               
                            data))

;list of (features . result)
(provide toy)
(define toy (format toy-raw))

(provide titanic)
(define titanic (format titanic-raw))

(provide mushroom)
(define mushroom (format mushroom-raw))

;============================================================================================================
;============================================================================================================
;============================================================================================================

;get fraction of result fields that are 1
;used to find probability value at leaf
(provide get-leaf-prob)
(define (get-leaf-prob data)
  (/ (length (filter-not (lambda (x) (zero? (cdr x))) data)) (length data))
  )

;get entropy of dataset
(provide get-entropy)
(define (get-entropy data)
  ( define prob (get-leaf-prob data ))
  (if (or (zero? prob) (equal? prob 1)) -inf.0
      (/ (+ ( * prob (log prob  )) (* ( - 1 prob) (log ( - 1 prob)))) (* -1 (log 2)))))
  

;find the difference in entropy achieved
;by applying a decision function f to the data
(provide entropy-diff)
(define (entropy-diff f data)
  (define filf (group-by (lambda (x) (f (car x))) data))
  (define eha  ( / (foldr (lambda (filfx y)( + ( * (get-entropy filfx ) (length filfx)) y))
                          0
                          filf)
                   (length data)))
  (- ( get-entropy data) eha)
  )

;choose the decision function that most reduces entropy of the data
(provide choose-f)
(define (choose-f candidates data) ; returns a decision function
  (foldr ( lambda ( x y) (if ( > (entropy-diff (cdr x) data) (cdr y))
                             (cons  x (entropy-diff (cdr x) data) ) y))
         ( cons 0 0)
         candidates)
  )
  
  

(provide DTree)
(struct DTree (desc func kids))

;build a decision tree (depth limited) from the candidate decision functions and data
(provide build-tree)
(define (build-tree candidates data depth)
  (define chosen (choose-f candidates data))
  (define new-cand (filter-not (lambda (x) (equal? (car chosen) x)) candidates))
  ( if (zero? (- depth 1)) (DTree (~a (get-leaf-prob data)) "leaf" '())
       (DTree (caar chosen) (~a (cdr chosen))  (map (lambda (x)
                                                ( build-tree new-cand x (- depth 1))
                                                 )
                                              (group-by (lambda (x) ((cdar chosen) (car x)))
                                                        data)
                                              )
              )
       )
  )
;given a test data (features only), make a decision according to a decision tree
;returns probability of the test data being classified as 1
;;;(provide make-decision)
;;;(define (make-decision tree test)
;;;...
;;;)

;============================================================================================================
;============================================================================================================
;============================================================================================================

;annotate list with indices
(define (pair-idx lst n)
  (if (empty? lst) `() (cons (cons (car lst) n) (pair-idx (cdr lst) (+ n 1))))
  )

;generate tree edges (parent to child) and recurse to generate sub trees
(define (dot-child children prefix tabs)
  (apply string-append
         (map (lambda (t)
                (string-append tabs
                               "r" prefix
                               "--"
                               "r" prefix "t" (~a (cdr t))
                               "[label=\"" (~a (cdr t)) "\"];" "\n"
                               (dot-helper (car t)
                                           (string-append prefix "t" (~a (cdr t)))
                                           (string-append tabs "\t")
                                           )
                               )
                ) children
                  )
         )
  )

;generate tree nodes and call function to generate edges
(define (dot-helper tree prefix tabs)
  (let* ([node (match tree [(DTree d f c) (cons d c)])]
         [d (car node)]
         [c (cdr node)])
    (string-append tabs
                   "r"
                   prefix
                   "[label=\"" d "\"];" "\n\n"
                   (dot-child (pair-idx c 0) prefix tabs)
                   )
    )
  )

;output tree (dot file)
(provide display-tree)
(define (display-tree tree outfile)
  (write-file outfile (string-append "graph \"decision-tree\" {" "\n"
                                     (dot-helper tree "" "\t")
                                     "}"
                                     )
              )
  )
;============================================================================================================
;============================================================================================================
;============================================================================================================