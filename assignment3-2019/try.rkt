#lang racket
(require racket/struct)
(require "defs.rkt")
(require "examples.rkt")
(require "model-interpreter.rkt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(displayln "Program 1********************************\n")
;
(displayln prog1)
;
(displayln "\n\nProgram evaluation ********************************\n")

(let ([main (eval-program prog1)])

  (begin
    (newline)
    (displayln "\n\nProgram result ********************************")
    (displayln main)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(displayln "Program 2********************************\n")
;;
;(displayln prog2)
;;
;(displayln "\n\nProgram evaluation ********************************\n")
;
;(let ([main (eval-program prog2)])
;
;  (begin
;    (newline)
;    (displayln "\n\nProgram result ********************************")
;    (displayln main)))

;;and so on 