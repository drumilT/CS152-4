#lang racket

(define storable%
  (class object%
    (super-new)
    (define/public (read) (error "Should be overridden"))
    (define/public (write) (error "Should be overridden"))
    (define/public (print) (error "Should be overridden"))))

(define register%
  (class storable%
    (init name)
    (super-new)
    (define/override (read) (#.....#))
    (define/override (write)(#.....#))
    (define/override (print)(#.....#))
))

(define memory%
  ( class storable%
     (init name)
     (super-new)
     (define/override (read) (#.....#))
    (define/override (write)(#.....#))
    (define/override (print)(#.....#))
))


    ;;;;;;
;; 1) field is public ix
;;    a) (init ix)
;;          (field [x ix])
    ;;b) (init-field x)

 ;;2) x is private
    ;;a) (init x)
    ;; (define x ix)
    ;;;;;;  
    

(define processor%
  (class object%
    (super-new)
    (init mem-size)
    (init reg-names) ;;
    (field [memory (new memory% [size mem-size])])
    (field [reg-bank (new register-bank% [names reg-names])])
    (init-field inst-set)
    
    (define/public (execute prog)
      (if (null? prog)   "Done"
          (begin
            (let* ([instr (car prog)]
                   [no-of-operands ( - (length instr ) 1)]
                   [mnemonic ( car instr)])
              (cond [(equal? mnemonic 'load)
                     (send reg-bank write (cadr instr) (caddr instr))]
                    [(equal? mnemonic 'store)
                     (send memory write (cadr instr) (send reg-bank read (caddr instr)))]
                    [(assoc mnemonic inst-set)
                     (let* ([ins (assoc mnemonic inst-set)]
                       [fun (cadr ins)])
                       (cond [(= no-of-operands 1)
                              (let * ([rname (cadr instr)]
                                      [val (fun (send reg-bank read rname))])
                                (send reg-bank write rname val))]
                             [(= no-of-operands 2)
                              (let * ([rname1 (cadr instr)]
                                      [rname2 (caddr instr)]
                                      [val (fun (send reg-bank read rname1)
                                                (send reg-bank read rname2))])
                                (send reg-bank write rname1 val))]))]
                    [else (error"Unexpected Instruction")])
              (displayln "------------")
              (display "instr:")
              (displayln (car prog))
              (newline)
              (display "Memory: ")
              (newline)
              (send memory print)
              (newline)
              (display "Registers: ")
              (newline)
              (send reg-bank print)
          (execute (cdr prog))))))))