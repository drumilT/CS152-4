#lang racket/base

;; You can require more modules of your choice.
(require racket/list
         racket/string
         (prefix-in utils: "utils.rkt")
         "list-comprehension.rkt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                 ;;
;; Ciphertext Statistics                                                           ;;
;; =====================                                                           ;;
;;                                                                                 ;;
;; The module should provide a bunch of functions that do statistical analysis of  ;;
;; ciphertext. The output is almost always just an ordered list (counts are        ;;
;; omitted).                                                                       ;;
;;                                                                                 ;;
;; Fill in the body for the skeletons and do not change the arguments. You can     ;;
;; define as many functions as you require, there's no special credit for          ;;
;; implementing/using all of them.                                                 ;;
;;                                                                                 ;;
;; CAUTION:                                                                        ;;
;; 1. Be mindful that bi, tri and quadgrams do not cross word boundaries. Hence,   ;;
;; you must process each word separately.                                          ;;
;;                                                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Analyses
(provide cipher-monograms
         cipher-bigrams
         cipher-unique-neighbourhood
         cipher-neighbourhood
         cipher-trigrams
         cipher-quadgrams
         cipher-common-words-single
         cipher-common-words-double
         cipher-common-words-triple
         cipher-common-words-quadruple
         cipher-common-initial-letters
         cipher-common-final-letters
         cipher-common-double-letters
         ;; any other functions of your design come below:

         ;; my-fundoo-analysis
         )
;;checks presence of an element in the list of consed values
(define (check-present key lst)
  (foldl (lambda (x y)(or y (equal? key (car x))) ) #f lst))
;; Takes ciphertext and produces a list of cipher chars sorted in decreasing
;; order of frequency.


(define (cipher-monograms ciphertext)
  (lc (car char) : char <- (sort (foldr (lambda ( x y) (if (check-present x y)
                                           (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                           (append (list (cons x 1)) y)
                                           )
                          )
                        '()
                        (string->list ciphertext)
                        )
                 ( lambda ( x y) (> (cdr x) (cdr y)))
                 )
      ))

;; Takes the cipher-word-list and produces a list of 2-letter bigram (strings)
;; sorted in decreasing order of frequency. Each element must be a string!
(define (string->pairlist strng n)
  (if (< (string-length strng) n ) '() (append (list (substring strng 0 n) ) (string->pairlist ( substring strng 1 ) n))))

(define (cipher-bigrams cipher-word-list)
  (lc (car char-pair) : char-pair <- (sort (foldr (lambda ( x y) (if (check-present x y)
                                           (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                           (append (list (cons x 1)) y)
                                           )
                          )
                        '()
                        (foldr (lambda (word y) ( append (string->pairlist word 2 ) y)) '() cipher-word-list)
                        )
                 ( lambda ( x y) (> (cdr x) (cdr y)))
                 )
      ))

;; Takes the bigram frequency order (output of `cipher-bigrams`) and computes
;; the neighbourhood of each letter with every other letter. Only unique
;; neighbours are to be counted.
;; Consider the character #\o.
;;
;; Takes an argument `mode`:
;; 1. (cipher-unique-neighbourhood cipher-bigrams 'predecessor)
;;    - Count only those unique occurrences where the (given) char preceeds
;;      other char.
;;    - Patterns of the form: "o?"
;; 2. (cipher-unique-neighbourhood cipher-bigrams 'successor)
;;    - Count only those unique occurrences where the (given) char succeeds
;;      other char.
;;    - Patterns of the form: "?o"
;; 3. (cipher-unique-neighbourhood cipher-bigrams 'both)
;;    - Count all unique occurrences where the (given) char neighbours the other
;;      char.
;;    - Patterns of the form "?o" and "o?". Note that this is not sum of (1) and
;;    (2) always.
;;
;; The output is a list of pairs of cipher char and the count of it's
;; neighbours. The list must be in decreasing order of the neighbourhood count.
(define (cipher-unique-neighbourhood cipher-bigrams-list mode)
  ;; You must match against or test (using cond) for the `mode` argument. Possibilities are:
  ;; 'predecessor, 'successor, 'both
  ;; Figure out experimentally which of these is a good indicator for E vs T.
  '())

;; Takes the bigram frequency order (output of `cipher-bigrams`) and computes
;; the neighbourhood of each letter with every other letter, but counts each
;; occurrence distinctly. This comment contains 6 bigrams with "w", all with "i" or "h".
;; So "w" has:
;; when mode is 'both,        6 neighbours
;; when mode is 'predecessor, 6 neighbours
;; when mode is 'successor,   0 neighbours
(define (cipher-neighbourhood cipher-bigrams-list mode)
  ;; You must match against or test (using cond) for the `mode` argument. Possibilities are:
  ;; 'predecessor, 'successor, 'both
  ;; Figure out experimentally which of these is a good indicator for E vs T.
  '())

;; Takes the cipher-word-list and produces a list of 3-letter bigram (strings)
;; sorted in decreasing order of frequency. Each element must be a string!
(define (cipher-trigrams cipher-word-list)
  (lc (car char-pair) : char-pair <- (sort (foldr (lambda ( x y) (if (check-present x y)
                                           (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                           (append (list (cons x 1)) y)
                                           )
                          )
                        '()
                        (foldr (lambda (word y) ( append (string->pairlist word 3 ) y)) '() cipher-word-list)
                        )
                 ( lambda ( x y) (> (cdr x) (cdr y)))
                 )
      ))

;; Takes the cipher-word-list and produces a list of 4-letter bigram (strings)
;; sorted in decreasing order of frequency. Each element must be a string!
(define (cipher-quadgrams cipher-word-list)
  (lc (car char-pair) : char-pair <- (sort (foldr (lambda ( x y) (if (check-present x y)
                                           (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                           (append (list (cons x 1)) y)
                                           )
                          )
                        '()
                        (foldr (lambda (word y) ( append (string->pairlist word 4 ) y)) '() cipher-word-list)
                        )
                 ( lambda ( x y) (> (cdr x) (cdr y)))
                 )
      ))


;; Takes the cipher word list and produces a list of single letter words, sorted
;; in decreasing order of frequency. Each element must be a string!
(define (cipher-common-words-single cipher-word-list)
  (lc (car char-pair) : char-pair <- (sort (foldr (lambda ( x y)
                                                    (if ( = (string-length x) 1 )
                                                    (if (check-present x y)
                                                        (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                                        (append (list (cons x 1)) y)
                                                        )
                                                     y)) 
                                                  '()
                                                  cipher-word-list
                                                  )
                                           ( lambda ( x y) (> (cdr x) (cdr y)))
                                           )
      )
  )



;; Takes the cipher word list and produces a list of double letter words, sorted
;; in decreasing order of frequency.
(define (cipher-common-words-double cipher-word-list)
  (lc (car char-pair) : char-pair <- (sort (foldr (lambda ( x y)
                                                    (if ( = (string-length x) 2 )( 
                                                    if (check-present x y)
                                                        (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                                        (append (list (cons x 1)) y)
                                                        )
                                                     y))
                                                  '()
                                                  cipher-word-list
                                                  )
                                           ( lambda ( x y) (> (cdr x) (cdr y)))
                                           )
      )
  )
    


;; Takes the cipher word list and produces a list of triple letter words, sorted
;; in decreasing order of frequency.
(define (cipher-common-words-triple cipher-word-list)
 (lc (car char-pair) : char-pair <- (sort (foldr (lambda ( x y)
                                                    (if ( = (string-length x) 3 )( 
                                                    if (check-present x y)
                                                        (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                                        (append (list (cons x 1)) y)
                                                        )
                                                     y))
                                                  '()
                                                  cipher-word-list
                                                  )
                                           ( lambda ( x y) (> (cdr x) (cdr y)))
                                           )
      )
  )

;; Takes the cipher word list and produces a list of four letter words, sorted
;; in decreasing order of frequency.
(define (cipher-common-words-quadruple cipher-word-list)
  (lc (car char-pair) : char-pair <- (sort (foldr (lambda ( x y)
                                                    (if ( = (string-length x) 4 )( 
                                                    if (check-present x y)
                                                        (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                                        (append (list (cons x 1)) y)
                                                        )
                                                     y))
                                                  '()
                                                  cipher-word-list
                                                  )
                                           ( lambda ( x y) (> (cdr x) (cdr y)))
                                           )
      )
  )

;; Takes the cipher word list and produces a list of chars that appear at the
;; start of words, sorted in decreasing order of frequency. Each element must be
;; a char!
(define (cipher-common-initial-letters cipher-word-list)
  (lc (car char) : char <- (sort (foldr (lambda ( x y) (if (check-present x y)
                                           (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                           (append (list (cons x 1)) y)
                                           )
                          )
                        '()
                         (foldr (lambda (word y) ( append (list (car (string->list word))) y)) '() cipher-word-list)
                        )
                 ( lambda ( x y) (> (cdr x) (cdr y)))
                 )
      ))

;; Takes the cipher word list and produces a list of chars that appear at the
;; end of words, sorted in decreasing order of frequency. Each element must be
;; a char!
(define (cipher-common-final-letters cipher-word-list)
   (lc (car char) : char <- (sort (foldr (lambda ( x y) (if (check-present x y)
                                           (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                           (append (list (cons x 1)) y)
                                           )
                          )
                        '()
                         (foldr (lambda (word y) ( append (list (car (reverse (string->list word)))) y)) '() cipher-word-list)
                        )
                 ( lambda ( x y) (> (cdr x) (cdr y)))
                 )
      ))

;; Takes the cipher word list and produces a list of chars that appear as
;; consecutive double letters in some word, sorted in decreasing order of
;; frequency. Each element must thus be a char!

(define (string->repeatlist lst)
  (if (< (length lst) 2 ) '() (append (if (equal? (car lst) (cadr lst)) (list (car lst)) '() ) (string->repeatlist ( cdr lst)))))

(define (cipher-common-double-letters cipher-word-list)
  (lc (car char-pair) : char-pair <- (sort (foldr (lambda ( x y) (if (check-present x y)
                                           (lc (if (equal? x (car t)) (cons (car t) (+ 1 (cdr t))) t): t <- y)
                                           (append (list (cons x 1)) y)
                                           )
                          )
                        '()
                        (foldr (lambda (word y) ( append (string->repeatlist (string->list word )) y)) '() cipher-word-list)
                        )
                 ( lambda ( x y) (> (cdr x) (cdr y)))
                 )
      ))