#lang racket/base

;; You can require more modules of your choice.
(require racket/list
         racket/string
         (prefix-in utils: "utils.rkt")
         "list-comprehension.rkt"
         (prefix-in  algo: "secret-word-enumeration.rkt"))

(provide dictionary-closure
         update)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                  ;;
;; Dictionary Closure                                                               ;;
;; ==================                                                               ;;
;;                                                                                  ;;
;; A choice of substitution can really trigger more substitutions by looking at the ;;
;; partially decrypted text - surely there will be some words which can be uniquely ;;
;; determined using the dictionary. It is prudent to concretize this "choice" as    ;;
;; this purely deterministic (involving absolutely no guess-work). In more          ;;
;; technical terms, this is called "maintaining arc-consistency" (look it up on     ;;
;; Wikipedia).                                                                      ;;
;;                                                                                  ;;
;; This function must utilise the dictionary and the cipher-word-list. Decrypt each ;;
;; word (`utils:decrypt`) and check if the dictionary has:                          ;;
;;                                                                                  ;;
;; 1. a unique completetion!                                                        ;;
;;    - Extend your key using the information with this match. Continue exploring   ;;
;;      the words under the extended key.                                           ;;
;; 2. many completions.                                                             ;;
;;    - Do nothing, just continue exploring the words under the same key. If none   ;;
;;      of the words fall into (1), return with the key that you have built so far. ;;
;; 3. no completions!                                                               ;;
;;    - Return `#f` (false), indicating that this partial key is wrong, and we must ;;
;;      revert to the original key.                                                 ;;
;;                                                                                  ;;
;; Returns either of:                                                               ;;
;; a. a (possibly) extended-key.                                                    ;;
;; b. `#f` if this key led to case (3) for some word.                               ;;
;;                                                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (word-check part-word) ;; Returns a complete/incomplete word or false (#f)
  ( if  ( = 0 (length (match part-word))) #f
        ( if ( = 1 (length (match part-word)))
             ( car (match part-word ))
              part-word)))     

(define (match key)
  (lc x : x <- utils:dictionary @(and (= (string-length key) (string-length x))(check-if-match x key) )
  ))

(define (check-if-match word key)
 (foldl (lambda ( x y) (and y ( if (char-lower-case? (cdr x) ) #t (equal? (car x) (cdr x)))))
        #t
        ( map cons ( string->list word) (string->list key ))
  ))

(define replaceNth
  (lambda (nth item list1)
    (cond [(= nth 1) (append (list item) (cdr list1))] 
          [else (append (list (car list1)) (replaceNth (- nth 1) item (cdr list1)))])))

(define (update key word-pair)
  (foldr (lambda (x y) (if ( equal? (car x)(cdr x)) y (replaceNth ( - (char->integer (cdr x)) 64 ) (car x) y))) key word-pair ))

(define (call key lst)
(if (null? lst) key (
 if (equal? (car lst) (word-check (car lst))) (call key (cdr lst))
    ( if  (not (boolean? (word-check (car lst))))
         (dictionary-closure ( update key
                                                        ( map cons ( string->list (car lst))
                                                                              (string->list (word-check (car lst))))
                                                               ))
          #f ))))

(define (sanitize-text ciphertext)
  (regexp-replace* (pregexp "'\\w+") ciphertext ""))

  (define (dictionary-closure key)
    (if  (and (algo:secret-word-enumeration key) (printf (string-append ( list->string key) "\n" )))
        (call (algo:secret-word-enumeration key) (regexp-match* (pregexp "\\w+") (sanitize-text (utils:decrypt key utils:ciphertext))))
        #f))
