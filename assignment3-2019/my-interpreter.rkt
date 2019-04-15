#lang racket
(require racket/struct)
(provide (all-defined-out))
(require "defs.rkt")
(require "examples.rkt")

(define stacks (make-vector 100))
(define stacksindex 0)

;;Global definitions. A counter that tracks the framenumber
(define framenumber 0)

;The stack and its operations. I have decided to make the stack a global.
(define stack '())
(define (push frame) (set! stack (cons frame stack)))
(define (pop) (if (null? stack) (error "Empty stack")
                  (set! stack (cdr stack))))
(define (top) (if (null? stack) (error "Empty stack")
                  (car stack)))


;createframe creates a new frame. It gets its number from
;;framenumber and as a side effect increases framenumber
(define (createframe hashtable parent) ;hastable gives the initial bindings
  (let ((num framenumber))
    (begin (set! framenumber (+ num 1))
           (frame num hashtable parent)
           )
    )
  )

;This creates the global frame, which, in our case, contains
;empty bindings.
(push (createframe (make-hash '()) (emptyframe)))

;This interprets a program. It uses the following function processdef.
(define (eval-program prog)
  (match prog
    [(pgm deflist) (begin (map (lambda (x) (processdef x (top))) deflist) (return-value-of-main (top))) ]))

;;processdef describes how each definition is processed and added to
;;the frame fr.
(define (processdef defn fr)
  (match defn    
    [(def v/f exp) (hash-set! (frame-bindings fr) v/f (eval-exp exp))]
    )
  )


;; We have said that the result of the program is the value of
;; the symbol main. main must be a defined symbol in each program.
(define (return-value-of-main frame)
  (hash-ref! (frame-bindings frame) 'main "main not found"))

;; The expression evaluator is the heart of the interpreter.
;; It will use the functions below

(define (eval-exp exp)
  (cond [(number? exp) exp]
        [(symbol? exp) (let ((p_frame (search exp (top)))) (if (emptyframe?  p_frame) (begin (displayln "notfound")(exit))(hash-ref (frame-bindings p_frame) exp)))]
        [(boolean? exp) exp]
        [(list? exp) exp]
        [(string? exp) exp]
        [else (match exp
                [(def v/f exp) (processdef exp (top))]
                [(uexp op exp1) (op (eval-exp exp1))  ]
                [(bexp op exp1 exp2) (op (eval-exp exp1) (eval-exp exp2))]
                [(lam var _) (closure exp (top))]
                [(app exp1 explist) (let* ((p_frame (search exp1 (top)))
                                           (f_closure (if (symbol? exp1)(hash-ref (frame-bindings p_frame) exp1) (eval-exp exp1)))
                                           (f_frame (closure-frame f_closure))
                                           (f_lam (closure-lambda f_closure))
                                           (f_var (lam-varlist f_lam))
                                           (f_exp (lam-exp f_lam))
                                           (exp_val (map eval-exp explist))
                                           (l_pair (map cons f_var exp_val))
                                           (var_val_hash (make-hash l_pair))
                                           (n_frame (createframe var_val_hash f_frame)))
                                      (begin (push n_frame) (begin0 (eval-exp f_exp) (pop))))]
                [(sett var exp) (let* ((p_frame (search var (top)))
                                       ( val (eval-exp exp)))
                                  (hash-set! (frame-bindings p_frame) var val))]
                [(beginexp expl) (process-beginexp expl)]
                [(lett defl exp) (let* ((def_list (map (lambda (x)
                                                         (let ((name (def-var/fun x))
                                                               (val (eval-exp (def-exp x))))
                                                           (cons name val)
                                                           ))
                                                       defl)
                                          )
                                        (var-val-hash (make-hash def_list))
                                        (n_frame (createframe var-val-hash (top)))
                                        )
                                   (begin (push n_frame)
                                          (begin0 (eval-exp exp)
                                                  (pop))))]
                [(lets defl exp) (process-lets defl exp)]
                [(iff cond exp1 exp2) (let((condtn (eval-exp cond)))(if condtn (eval-exp exp1) (eval-exp exp2)))]
                [(defexp deflist exp) (begin (map (lambda (x) (processdef x (top))) deflist)(eval-exp exp))]
                ; ...and so on, fill in these...
                ;[(debugexp) (begin
                ;             (print-current-environment (top))
                ;             )]
                [(debugexp) (begin
                              (vector-set! stacks stacksindex stack)
                              (set! stacksindex (+ 1 stacksindex)))]
                )
              ]))

;;An auxilliary function that processes a begin expression
(define (process-beginexp explist)
  (match explist
    [(cons x '()) (eval-exp x)]
    [(cons x l) (begin (eval-exp x) (process-beginexp l))]))

;;An auxilliary function that processes a let expression.
;;The let definitions are in deflist, and the let body is exp.
(define (process-lets deflist exp)
  (match deflist
    ['() (eval-exp exp)]
    [(cons x l) (begin
                  (let* ((name (def-var/fun x))
                         (d_exp (def-exp x))
                         (val (eval-exp d_exp))
                         (var_val (cons name val))
                         (key-map (list var_val))
                         (var-hash (make-hash key-map))
                         (n_frame (createframe var-hash (top)))
                         )
                    (push n_frame)
                    )
                  (begin0
                    (process-lets (cdr deflist) exp)
                    (pop))
                  )]))
;;Prints the current environment running through a chain of frames.
;;Note that my struct definitions are such that if fr is a frame,
;;then (displayln fr) will print the frame in the format that I have
;;shown. 
(define (print-current-environment fr)
  (cond [(not(emptyframe? fr)) (begin (displayln fr) (print-current-environment (frame-parent fr)))])
  )

;;Search for the symbol sym in an environment that starts with the frame
;;fr. We shall make search return either the  emptyframe
;;or the frame containing the symbol (note, not the value of the
;;symbol itself.

(define (search sym fr)
  (if (emptyframe? fr ) fr 
      (let* ((hash (frame-bindings fr))
             (parent (frame-parent fr)))
        (if (hash-ref hash sym #f ) fr (search sym parent )))))
               
(define (cleanup)
  (set!  stacks (make-vector 100))
  (set! stacksindex 0)
  (set! framenumber 0)
  (set! stack '())
  (push (createframe (make-hash '()) (emptyframe))))

