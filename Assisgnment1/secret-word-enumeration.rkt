#lang racket

;; You can require more modules of your choice.
(require racket/string
         racket/list
         (prefix-in utils: "utils.rkt")
         "list-comprehension.rkt")

(provide secret-word-enumeration)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                           ;;
;; Secret Word Enumeration                                                                   ;;
;; =======================                                                                   ;;
;;                                                                                           ;;
;; This step exploits the fact that all keys begin with a secret word that is a              ;;
;; proper SIX-LETTER word from the English dictionary.                                       ;;
;;                                                                                           ;;
;; Given a partial key, we can query the dictionary for a list of 6 letter words             ;;
;; that can potentially begin the key.                                                       ;;
;; We can then filter out potential candidates whose keys do not agree with our partial key. ;;
;;                                                                                           ;;
;; It is possible that given a (wrong) partial key, we discover that none of these           ;;
;; potential candidates can agree with our partial key. This really implies a                ;;
;; mistake in the choice of substitution, since dictionary-closure is completely             ;;
;; deterministic (modulo any bugs in your implementation :)                                  ;;
;;                                                                                           ;;
;; Hence, this function must return either of:                                               ;;
;; a. `#f` if there are no consistent candidates for this key.                               ;;
;; b. the original key if there are multiple consistent candidates.                          ;;
;; c. the complete key if there's only one consistent candidate!                             ;;
;;                                                                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (secret-word-enumeration key-after-dictionary-closure) ;; Returns a key or false (#f)
  ( if  ( = 0 (length (match key-after-dictionary-closure))) #f
        ( if ( = 1 (length (match key-after-dictionary-closure)))
             ( car (match ( substring key-after-dictionary-closure 0 6)))
             key-after-dictionary-closure)))
     

(define (match key)
  (lc x : x <- utils:dictionary @(and (= 6 (string-length x))(check-if-match x (string-upcase key)) )
  ))

(define (check-if-match word key)
 (foldl (lambda ( x y) (and y ( if (equal? (cdr x) #\space) #t (equal? (car x) (cdr x)))))
        #t
        ( map cons ( string->list ( substring word 0 6)) (string->list ( substring key 0 6)))
  ))