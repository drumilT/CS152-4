#lang racket
(provide (all-defined-out))
(require "q4a.rkt")
(define (true-match-pattern s l)
  (define (myfind x done)
    (cond [(null? done) #f]
          [(equal? x (car (car done))) (cdr (car done))]
          [else (myfind x (cdr done))]))
  (define (rest s f)
    (cond [(null? f) s]
          [(null? s) #f]
          [(equal? (car f) (car s)) (rest (cdr s) (cdr f))]
          [else #f]))
  (define (try-all s l done curr sym)
     (let ([sl (solve s l (cons (cons sym curr) done))])
          (if (list? sl)
              sl
              (if (null? s) #f
                  (try-all (cdr s) l done (append curr (list (car s))) sym)))))
  (define (solve s l done)
    (cond [(null? l) (if (null? s) done #f)]
          [(null? s) #f]
          [else (let [(f (myfind (car l) done))]
                  (if (list? f)
                      (let [(rst (rest s f))]
                        (if (list? rst)
                            (solve rst (cdr l) done)
                            #f))
                      (try-all (cdr s) (cdr l) done (list (car s)) (car l))))]))
  (define soln (solve (string->list s) l '()))
  (if (list? soln)
      (reverse (map (lambda (x)
             (cons (car x) (list->string (cdr x)))) soln))
      "No match"))

(define (check s l)
  (define ans (match-pattern s l))
  (define (format ans)
    (define allsym (map (lambda (x) (car x)) ans))
    (define allans (map (lambda (x) (cdr x)) ans))
    (and (equal? allsym (remove-duplicates allsym))
         (not (member "" allans))))
  (define (rmv s x)
    (cond [(null? x) s]
          [(null? s) #f]
          [(equal? (car s) (car x)) (rmv (cdr s) (cdr x))]
          [else #f]))
  (define (get ans s)
    (if (null? ans) #f
        (if (equal? (caar ans) s)
            (string->list (cdar ans))
            (get (cdr ans) s))))
  (define (check s l)
    (cond[(null? l) (null? s)]
         [else (let ([x (rmv s (get ans (car l)))])
                 (if (list? x) (check x (cdr l)) #f))]))
  (if (list? ans)
      (and (format ans) (check (string->list s) l))
      (if (equal? ans (true-match-pattern s l)) #t #f)))
